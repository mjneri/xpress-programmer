/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

 Low Voltage Programming Interface

  Bit-Banged implementation of the PIC16F1 (250K) LVP protocol
  Based on the PIC16F188XX specification

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

*******************************************************************************/
#include "system.h"
#include <string.h>
#include <stdlib.h>

// device specific parameters (DS40001753B)
#define ROW_SIZE     32      // width of a flash row in words
#define CFG_ADDRESS 0x8000   // address of config words area
#define CFG_FIRST   0x8007   // address of first config word
#define DEV_ID      0x8006
#define REV_ID      0x8005
#define EE_ADDRESS  0xf000  // DATA EE area

#define CFG_NUM      5       // number of config words
#define WRITE_TIME   3       // mem write time ms
#define CFG_TIME     6       // cfg write time ms
#define BULK_TIME    6       // bulk erase time ms

/****************************************************************************/
// internal state
uint16_t row[ ROW_SIZE];     // buffer containing row being formed
uint32_t row_address = -1;   // destination address of current row

// ICSP commands
#define  CMD_LOAD_ADDR        0x80
#define  CMD_INC_ADDR         0xF8
#define  CMD_LATCH_DATA       0x00
#define  CMD_LATCH_DATA_IA    0x02
#define  CMD_READ_DATA        0xFC
#define  CMD_READ_DATA_IA     0xFE
#define  CMD_BEGIN_PROG       0xE0
#define  CMD_BULK_ERASE       0x18

void ICSP_slaveReset(void){
    ICSP_nMCLR = SLAVE_RESET;
    ICSP_TRIS_nMCLR = PIN_OUTPUT;
}

void ICSP_slaveRun(void){
    ICSP_nMCLR = SLAVE_RUN;
    ICSP_TRIS_nMCLR = PIN_OUTPUT;
}

void ICSP_init(void )
{
    ICSP_TRIS_DAT  = PIN_INPUT;
    ICSP_CLK       = 0;
    ICSP_TRIS_CLK  = PIN_OUTPUT;
}

void ICSP_release(void)
{
    ICSP_TRIS_DAT  = PIN_INPUT;
    ICSP_TRIS_CLK  = PIN_INPUT;
    ICSP_slaveRun();
}

void ICSP_sendCmd(uint8_t b)
{
    uint8_t i;
    ICSP_TRIS_DAT = PIN_OUTPUT;
    for( i=0; i<8; i++){        // 8-bit commands
        if ((b & 0x80) > 0)
            ICSP_DAT = 1;       // Msb first
        else
            ICSP_DAT = 0;
        ICSP_CLK = 1;
        b <<= 1;                // shift left
        __delay_us(1);
        ICSP_CLK = 0;
        __delay_us(1);
    }
    __delay_us(1);
}

void ICSP_sendData( uint24_t w)
{
    uint8_t i;

    w = (w <<1) & 0x7ffffe;     // add start and stop bits
    ICSP_TRIS_DAT = PIN_OUTPUT;
    for( i=0; i < 24; i++){
        if ((w & 0x800000) > 0) // Msb first
            ICSP_DAT = 1;
        else
            ICSP_DAT = 0;
        ICSP_CLK = 1;
        w <<= 1;
        __delay_us(1);
        ICSP_CLK = 0;
        __delay_us(1);
    }
}

void ICSP_signature(void){
    ICSP_slaveReset();          // MCLR output => Vil (GND)
    __delay_ms(10);
    ICSP_sendCmd('M');
    ICSP_sendCmd('C');
    ICSP_sendCmd('H');
    ICSP_sendCmd('P');
    __delay_ms(5);
}

uint16_t ICSP_getData( void)
{
    uint8_t i;
    uint24_t w = 0;
    ICSP_TRIS_DAT = PIN_INPUT;
    for( i=0; i < 24; i++){     // 24 bit
        ICSP_CLK = 1;
        w <<= 1;                // shift left
        __delay_us(1);
        w |= ICSP_DAT_IN;       // read port, msb first (loose top byte)
        ICSP_CLK = 0;
        __delay_us(1);
    }
    return (w >> 1) & 0x3fff;
}

uint16_t ICSP_read(void)
{
    ICSP_sendCmd(CMD_READ_DATA);
    uint16_t data = ICSP_getData();
    ICSP_sendCmd(CMD_INC_ADDR);
    return data;
}

void ICSP_bulkErase(void)
{
    ICSP_sendCmd(CMD_LOAD_ADDR);  // enter config area to erase config words too
    ICSP_sendData(CFG_ADDRESS);
    ICSP_sendCmd(CMD_BULK_ERASE);
    __delay_ms(BULK_TIME);
}

void ICSP_skip(uint16_t count)
{
    while(count-- > 0){
        ICSP_sendCmd(CMD_INC_ADDR);     // increment address
    }
}

void ICSP_addressLoad(uint24_t address)
{
    ICSP_sendCmd(CMD_LOAD_ADDR);
    ICSP_sendData(address);
}

void ICSP_rowWrite(uint16_t *buffer, uint8_t count)
{
    while(count-- > 1){             // load n-1 latches
        ICSP_sendCmd(CMD_LATCH_DATA_IA);
        ICSP_sendData(*buffer++);
    }
    ICSP_sendCmd(CMD_LATCH_DATA);   // load last latch (n-1)
    ICSP_sendData(*buffer++);
    ICSP_sendCmd(CMD_BEGIN_PROG);
    __delay_ms(WRITE_TIME);
    ICSP_sendCmd(CMD_INC_ADDR);     // increment address only after prog. command!
}

void ICSP_cfgWrite(uint16_t *buffer, uint8_t count)
{
    ICSP_addressLoad(CFG_FIRST);
    while(count-- > 0){
        ICSP_sendCmd(CMD_LATCH_DATA);
        ICSP_sendData(*buffer++);
        ICSP_sendCmd(CMD_BEGIN_PROG);
        __delay_ms(CFG_TIME);
        ICSP_sendCmd(CMD_INC_ADDR);
    }
}

/****************************************************************************/

void LVP_enter(void)
{
    LED_on(RED_LED);
    LED_off(GREEN_LED);

    ICSP_init();                    // configure I/Os
    ICSP_signature();               // enter LVP mode
}

void LVP_exit(void)
{
    ICSP_release();                 // release ICSP-DAT and ICSP-CLK
    LED_off(RED_LED);
    LED_on(GREEN_LED);
    row_address = -1;
}

bool LVP_inProgress(void)
{
    return (ICSP_nMCLR == SLAVE_RESET);
}

void LVP_write(void) {
    // check for first entry in lvp
    if (!LVP_inProgress()) {
        LVP_enter();
        ICSP_bulkErase();
    }
    if (row_address == -1) {
        /* do nothing */
    }
    else if (row_address >= CFG_ADDRESS) {    // use the special cfg word sequence
        ICSP_cfgWrite( &row[7], CFG_NUM);
    }
    else { // normal row programming sequence
        ICSP_addressLoad( row_address);
        ICSP_rowWrite( row, ROW_SIZE);
    }
}

void LVP_commitRow( void) {
    // latch and program a row, skip if blank
    uint16_t chk = 0xffff;
    for(uint8_t i=0; i<ROW_SIZE; i++) chk &= row[i];  // blank check
    if (chk != 0xffff) {
        LVP_write();
        memset((void*)row, 0xff, sizeof(row));    // fill buffer with blanks
    }
}

/**
 * Align and pack words in rows, ready for lvp programming
 * @param address       starting address
 * @param data          buffer
 * @param data_count    number of bytes
 */
void LVP_packRow(uint32_t address, uint8_t *data, uint8_t data_count) {
    // copy only the bytes from the current data packet up to the boundary of a row
    uint8_t index = (address & 0x3e) >> 1;
    uint32_t new_row = (address & 0xfffffffc0) >> 1;
    if (new_row != row_address) {
        LVP_commitRow();
        row_address = new_row;
    }
    // ensure data is always even (rounding up)
    data_count = (data_count + 1) & 0xfe;
    // copy data up to the row boundaries
    while ((data_count > 0) && (index < ROW_SIZE)){
        uint16_t word = *data++;
        word += ((uint16_t)(*data++) << 8);
        row[index++] = word;
        data_count -= 2;
    }
    // if a complete row was filled, proceed to programming
    if (index == ROW_SIZE) {
        LVP_commitRow();
        // next consider the split row scenario
        if (data_count > 0) {   // leftover must spill into next row
            row_address += ROW_SIZE;
            index = 0;
            while (data_count > 0) {
                uint16_t word = *data++;
                word += ((uint16_t)(*data++) << 8);
                row[index++] = word;
                data_count -= 2;
            }
        }
    }
}

void LVP_programLastRow( void) {
    LVP_commitRow();
    LVP_exit();
}

//------------------------------------------------------------------------------

uint16_t LVP_readWord(uint24_t addr) {
    ICSP_addressLoad( addr);
    return ICSP_read();
}

void utohex(char* buffer, uint16_t word){
    char c = word & 0xf;
    buffer += 3;
    *buffer-- = c + ((c<10) ? '0' : ('A'-10)); word>>=4; c = word & 0xf;
    *buffer-- = c + ((c<10) ? '0' : ('A'-10)); word>>=4; c = word & 0xf;
    *buffer-- = c + ((c<10) ? '0' : ('A'-10)); word>>=4; c = word & 0xf;
    *buffer-- = c + ((c<10) ? '0' : ('A'-10));
}

void catHexWord(char *buffer, uint24_t addr) {
    buffer += strlen(buffer);   // append to buffer
    utohex(buffer, LVP_readWord(addr));
    buffer[strlen(buffer)] = ' ';
}

void catDecWord(char *buffer, uint24_t addr) {
    buffer += strlen(buffer);   // append to buffer
    utoa(buffer, LVP_readWord(addr), 10);
    buffer[strlen(buffer)] = ' ';
}

uint16_t LVP_getInfoSize(void) {
    // a multiple of 64-char segments
    return (2 + 4) * 64;    // must remain < 512
}

void read_DevID(char *buffer) {
    // read the DevID and RevID
    strcat(buffer, "\nDevice ID: ");
    catHexWord(buffer, DEV_ID);
    strcat(buffer, "\n\nRev ID   : ");
    catHexWord(buffer, REV_ID);
    strcat(buffer, "\n\nFlash    : ");
    strcat(buffer, "16KB\n");
}

void read_Config(char *buffer) {
    // read the CONFIG
    strcat(buffer, "\nConfiguration:\n");
    catHexWord(buffer, CFG_FIRST+0);
    catHexWord(buffer, CFG_FIRST+1);
    catHexWord(buffer, CFG_FIRST+2);
    catHexWord(buffer, CFG_FIRST+3);
    catHexWord(buffer, CFG_FIRST+4);
    strcat(buffer, "\n");
    strcat(buffer, "\nData EE  : 256B\n");
}

void read_NVM(char *buffer, uint16_t seg) {
//    uint16_t addr = 0x00 + (seg<<4);
    uint16_t addr = EE_ADDRESS + (seg<<3);
    *buffer++ = '\n';
    utohex(buffer, addr & 0x0fff);
    *(buffer+4) = ':';
    buffer += 5;
    for(uint8_t i=0; i<8; i++) {
        catHexWord(buffer, addr);
        addr += 1;
    }
}

void LVP_getInfo(char* buffer, uint16_t seg) {
    // read device information, returns a fixed (64 byte) string at a time
    if (seg == 0) LVP_enter();

    switch( seg) {
        case 0: read_DevID(buffer); break;
        case 1: read_Config(buffer); break;
        default:read_NVM(buffer, seg-2); break;
    }

    // padding with spaces (no \0 string terminator!)
    for(uint8_t i=strlen(buffer); i<64; i++)
        buffer[i] = ' ';

    if (seg == 6) LVP_exit();
}
