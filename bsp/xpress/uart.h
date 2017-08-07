/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

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

#ifndef USART_H
#define USART_H

#include <stdbool.h>
#include <stdint.h>
#include "system.h"
#include "pinout.h"

/*********************************************************************
* Function: void UART_Initialize(void);
* Overview: Initializes USART (RS-232 port)
********************************************************************/
void UART_init();

/******************************************************************************
 * Function:        void UART_putch(char c)
 * Input:           char c - character to print to the UART
 * Overview:        Sends one character to the UART
 *****************************************************************************/
void UART_putch(char);

/******************************************************************************
 * Function:        void UART_baudrateSet(void)
 * Overview:        Changes the UART baudrate
 *****************************************************************************/
void UART_baudrateSet(uint32_t);

/******************************************************************************
 * Function:        char UART_getch()
 * Output:          unsigned char c - character received from the UART
 * Overview:        Get the input character from the UART
 *****************************************************************************/
unsigned char UART_getch(void);

#endif //USART_H
