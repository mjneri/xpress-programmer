/*
 * File:   pinout.h
 *
 * pinout assignements for 25k50 Universal programmer board
 */

#ifndef PINOUT_H
#define	PINOUT_H

#define PIN_INPUT           1
#define PIN_OUTPUT          0

#define PIN_DIGITAL         0
#define PIN_ANALOG          1


// LED pin mapping
#define LED_D1_LAT      LATBbits.LATB0
#define LED_D1_TRIS     TRISBbits.TRISB0
#define LED_D1_ANSEL    ANSELBbits.ANSB0
#define LED_D2_LAT      LATBbits.LATB1
#define LED_D2_TRIS     TRISBbits.TRISB1
#define LED_D2_ANSEL    ANSELBbits.ANSB1
#define LED_ON          1
#define LED_OFF         0

// ICSP pin mapping
#define ICSP_TRIS_DAT       TRISBbits.TRISB3
#define ICSP_DAT            LATBbits.LATB3
#define ICSP_DAT_IN         PORTBbits.RB3
#define ICSP_TRIS_CLK       TRISBbits.TRISB2
#define ICSP_CLK            LATBbits.LATB2
#define ICSP_TRIS_nMCLR     TRISBbits.TRISB4
#define ICSP_nMCLR          LATBbits.LATB4
#define SLAVE_RESET         0
#define SLAVE_RUN           1

// button mapping
#define S1_PORT  PORTBbits.RB0
#define S1_TRIS  TRISBbits.TRISB0
#define S1_ANSEL ANSELBbits.ANSB0

#define BUTTON_PRESSED      0
#define BUTTON_NOT_PRESSED  1

// UART mapping
#define UART_ANSELTX  ANSELCbits.ANSC6
#define UART_TRISTX   TRISCbits.TRISC6
#define UART_ANSELRX  ANSELCbits.ANSC7
#define UART_TRISRX   TRISCbits.TRISC7

#define UART_ENABLE   RCSTAbits.SPEN
#define TXREG         TXREG1
#define RCREG         RCREG1
#define SPBRG         SPBRG1
#define SPBRGH        SPBRGH1
#define BAUDCON       BAUDCON1
#define RCIF          RC1IF

#define UART_TxRdy()      (TXSTA1bits.TRMT)

// Use following only for Hardware Flow Control
//#define UART_DTS          PORTAbits.RA3
//#define UART_DTR          LATCbits.LATC3
//#define UART_RTS          LATBbits.LATB4
//#define UART_CTS          PORTBbits.RB6

//#define mInitRTSPin() {TRISBbits.TRISB4 = 0;}   //Configure RTS as a digital output.
//#define mInitCTSPin() {TRISBbits.TRISB6 = 1;}   //Configure CTS as a digital input.  (Make sure pin is digital if ANxx functions is present on the pin)
//#define mInitDTSPin() {}//{TRISAbits.TRISA3 = 1;}   //Configure DTS as a digital input.  (Make sure pin is digital if ANxx functions is present on the pin)
//#define mInitDTRPin() {TRISCbits.TRISC3 = 0;}   //Configure DTR as a digital output.

//#define USE_SELF_POWER_SENSE_IO
#define tris_self_power     TRISAbits.TRISA2    // Input
#if defined(USE_SELF_POWER_SENSE_IO)
#define self_power          PORTAbits.RA2
#else
#define self_power          1
#endif

//#define USE_USB_BUS_SENSE_IO		//JP1 must be in R-U position to use this feature on this board
#define tris_usb_bus_sense  TRISBbits.TRISB5    // Input
#if defined(USE_USB_BUS_SENSE_IO)
#define USB_BUS_SENSE       PORTBbits.RB5
#else
#define USB_BUS_SENSE       1
#endif

//Uncomment this to make the output HEX of this project
//   to be able to be bootloaded using the HID bootloader
#define PROGRAMMABLE_WITH_USB_HID_BOOTLOADER

#endif	/* PINOUT_H */

