/* rs232-bricklet
 * Copyright (C) 2015 Olaf Lüke <olaf@tinkerforge.com>
 *
 * rs232.c: Implementation of RS232 Bricklet messages
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "rs232.h"

#include "brickletlib/bricklet_entry.h"
#include "bricklib/bricklet/bricklet_communication.h"
#include "bricklib/utility/util_definitions.h"
#include "config.h"

#define NUM_BAUDRATES 13
#define NUM_PARITIES 5
#define NUM_STOPBITS 2
#define NUM_WORDLENGTH 4
#define NUM_FLOWCONTROL 2

const uint16_t baudrates[NUM_BAUDRATES] = {
	3072, //    300 baud
	1536, //    600 baud
	768,  //   1200 baud
	384,  //   2400 baud
	192,  //   4800 baud
	96,   //   9600 baud
	64,   //  14400 baud
	48,   //  19200 baud
	32,   //  28800 baud
	24,   //  38400 baud
	16,   //  57600 baud
	8,    // 115200 baud
	4     // 230400 baud
};

const uint8_t parities[NUM_PARITIES] = {
	0, // None
	1 << 3, // Odd
	(1 << 3) | (1 << 4), // Even
	(1 << 3) | (1 << 5), // Forced Parity 1
	(1 << 3) | (1 << 4) | (1 << 5), // Forced Parity 0
};

const uint8_t stopbits[NUM_STOPBITS] = {
	0, // 1 Stopbit
	1 << 2 // 2 Stopbits
};

const uint8_t wordlength[NUM_WORDLENGTH] = {
	0, // 5
	1 << 0, // 6
	1 << 1, // 7
	(1 << 0) | (1 << 1) // 8
};

const uint8_t hardware_flowcontrol[NUM_FLOWCONTROL] = {
	0, // Hardware Flow Control Disabled
	(1 << 6) | (1 << 7), // Hardware Flow Control Enabled
};

const uint8_t software_flowcontrol[NUM_FLOWCONTROL] = {
	0, // Software Flow Control Disabled
	(1 << 3) | (1 << 1), // Software Flow Control Enabled
};

uint8_t sc16is740_get_address(void) {
	if(BS->address == I2C_EEPROM_ADDRESS_HIGH) {
		return I2C_ADDRESS_HIGH;
	} else {
		return I2C_ADDRESS_LOW;
	}
}

uint8_t sc16is740_read_fifo(uint8_t *data) {
	int8_t length = BUFFER_SIZE-1 - size_out();
	uint8_t rxlvl = sc16is740_read_register(I2C_INTERNAL_ADDRESS_RXLVL);
	length = MIN(length, rxlvl);

	if(length <= 0) {
		return 0;
	}

	BA->TWID_Read(BA->twid,
	              sc16is740_get_address(),
	              I2C_INTERNAL_ADDRESS_RHR << 3,
	              1,
	              data,
	              length,
	              NULL);

	return length;
}

uint8_t sc16is740_read_register(const uint8_t address) {
	uint8_t value = 0;

	BA->TWID_Read(BA->twid,
	              sc16is740_get_address(),
	              address << 3,
	              1,
	              &value,
	              1,
	              NULL);

	return value;
}

void sc16is740_write_register(const uint8_t address, uint8_t value) {
	BA->TWID_Write(BA->twid,
	               sc16is740_get_address(),
	               address << 3,
	               1,
	               &value,
	               1,
	               NULL);
}

void sc16is740_reconfigure(void) {
	BrickletAPI *ba = BA;
	if(ba->mutex_take(*ba->mutex_twi_bricklet, 10)) {
		ba->bricklet_select(BS->port - 'a');

		// Write 0xBF to LCR to be able to access EFR
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, 0xBF);

		// Enable or Disable Hardware Flow Control
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_EFR, hardware_flowcontrol[BC->hardware_flowcontrol] | software_flowcontrol[BC->software_flowcontrol]);

		// Configure UART
		uint8_t lcr = stopbits[BC->stopbits-1] | parities[BC->parity] | wordlength[BC->wordlength-5];
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, lcr);

		// Configure baudrate: ((14.7456 MHz * 1000000) / 1) /
		//                     (X baud * 16) = baudrates[BC->baudrate]
		lcr |= 1 << 7; // Divisor latch enable: LCR[7] = 1
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, lcr);

		sc16is740_write_register(I2C_INTERNAL_ADDRESS_DLL, baudrates[BC->baudrate]&0xFF);
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_DLH, (baudrates[BC->baudrate]>>8)&0xFF);

		lcr = sc16is740_read_register(I2C_INTERNAL_ADDRESS_LCR);
		lcr &= ~(1 << 7); // Divisor latch disable: LCR[7] = 0
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, lcr);

		ba->bricklet_deselect(BS->port - 'a');
		ba->mutex_give(*ba->mutex_twi_bricklet);
	}
}

void sc16is740_init(void) {
	BrickletAPI *ba = BA;
	if(ba->mutex_take(*ba->mutex_twi_bricklet, 10)) {
		ba->bricklet_select(BS->port - 'a');

		// Enable RX and TX FIFOs: FCR[0] = 1
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_FCR, 1 << 0);

		// Enable Receive Holding Register Interrupt: IER[0] = 1
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_IER, 1 << 0);

		ba->bricklet_deselect(BS->port - 'a');
		ba->mutex_give(*ba->mutex_twi_bricklet);
	}
}

void constructor(void) {
	_Static_assert(sizeof(BrickContext) <= BRICKLET_CONTEXT_MAX_SIZE,
	               "BrickContext too big");

    BrickContext *bc = BC;

	PIN_NIRQ.type = PIO_INPUT;
	PIN_NIRQ.attribute = PIO_PULLUP;
	BA->PIO_Configure(&PIN_NIRQ, 1);

	// Always keep NRESET to high, with newer hardware versions
	// NRESET is directly connected to VCC. This is necessary to
	// prevent rare EMI problems that result in unexpected resets.
	PIN_NRESET.type = PIO_OUTPUT_1;
	PIN_NRESET.attribute = PIO_DEFAULT;
	BA->PIO_Configure(&PIN_NRESET, 1);

	bc->read_callback_enabled = false;
	bc->frame_readable_cb_frame_size = 0;
	bc->frame_readable_cb_already_sent = false;
	bc->in_sync = true;

	bc->baudrate = 11;
	bc->parity = 0;
	bc->stopbits = 1;
	bc->wordlength = 8;
	bc->hardware_flowcontrol = 0;
	bc->software_flowcontrol = 0;
	bc->error = 0;

	read_configuration_from_eeprom();
	sc16is740_init();
	sc16is740_reconfigure();
}

void destructor(void) {
}

uint8_t size_in(void) {
	BrickContext *bc = BC;
	if(bc->in_start == bc->in_end) {
		return 0;
	}

	if(bc->in_start < bc->in_end) {
		return bc->in_end - bc->in_start;
	}

	return (BUFFER_SIZE - bc->in_start) + bc->in_end;
}

uint8_t size_out(void) {
	BrickContext *bc = BC;
	if(bc->out_start == bc->out_end) {
		return 0;
	}

	if(bc->out_start < bc->out_end) {
		return bc->out_end - bc->out_start;
	}

	return (BUFFER_SIZE - bc->out_start) + bc->out_end;
}

bool new_char_out(char out) {
	BrickContext *bc = BC;
	bc->out[bc->out_end] = out;

	// If buffer is full, we ignore new char
	if((bc->out_end+1) % BUFFER_SIZE != bc->out_start) {
		bc->out_end = (bc->out_end + 1) % BUFFER_SIZE;
		return true;
	}

	return false;
}

bool get_char_in(char *c) {
	BrickContext *bc = BC;
	if(bc->in_start != bc->in_end) {
		*c = bc->in[bc->in_start];
		bc->in_start = (bc->in_start + 1) % BUFFER_SIZE;
		return true;
	}

	return false;
}

bool is_irq(void) {
	return (!(PIN_NIRQ.pio->PIO_PDSR & PIN_NIRQ.mask)) && (size_out() < (BUFFER_SIZE-1));
}

bool try_read_data(void) {
	while(is_irq()) {
		uint8_t buffer[59];
		uint8_t length = sc16is740_read_fifo(buffer);
		if(length == 0) {
			return false;
		}

		for(uint8_t i = 0; i < length; i++) {
			// We don't have to check return value here, sc16is740_read_fifo
			// already made sure that there is enough space in the buffer.
			new_char_out(buffer[i]);
		}
		return true;
	}

	return false;
}

void tick(const uint8_t tick_type) {
	BrickContext *bc = BC;
	BrickletAPI *ba = BA;
	if(tick_type & TICK_TASK_TYPE_CALCULATION) {
		if(bc->break_time > 0) {
			bc->break_time--;
			if(bc->break_time == 0) {
				if(ba->mutex_take(*ba->mutex_twi_bricklet, 0)) {
					ba->bricklet_select(BS->port - 'a');
					uint8_t lcr = sc16is740_read_register(I2C_INTERNAL_ADDRESS_LCR);
					lcr &= ~(1 << 6); // Disable break control bit: LCR[6] = 0
					sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, lcr);
					ba->bricklet_deselect(BS->port - 'a');
					ba->mutex_give(*ba->mutex_twi_bricklet);
				}
			}
		}


		if(ba->mutex_take(*ba->mutex_twi_bricklet, 10)) {
			const bool is_try_read = is_irq();
			const bool is_size     = size_in() > 0;
			if(is_try_read || is_size) {
				ba->bricklet_select(BS->port - 'a');
				if(is_try_read) {
					try_read_data();
					// If we have read something, lets look if there was an error.
					const uint8_t lsr = sc16is740_read_register(I2C_INTERNAL_ADDRESS_LSR);
					if(lsr & (1 << 1)) {
						bc->error |= (1 << 0);
					}
					if(lsr & (1 << 2)) {
						bc->error |= (1 << 1);
					}
					if(lsr & (1 << 3)) {
						bc->error |= (1 << 2);
					}
				}

				// Use txlvl - 1 here, there may be a byte free in the FIFO, but the
				// THR is already full. In this case we would get an overflow if we
				// would write again!
				if(is_size) {
					int8_t txlvl = sc16is740_read_register(I2C_INTERNAL_ADDRESS_TXLVL) - 1;
					while((txlvl > 0) && (size_in() > 0)) {
						char c;
						if(get_char_in(&c)) {
							sc16is740_write_register(I2C_INTERNAL_ADDRESS_THR, c);
						}
						txlvl--;
					}
				}

				ba->bricklet_deselect(BS->port - 'a');
			}
			ba->mutex_give(*ba->mutex_twi_bricklet);
		}
	}

	if(tick_type & TICK_TASK_TYPE_MESSAGE) {
		uint8_t length = size_out();
		if(bc->read_callback_enabled && length > 0) {
			ReadCallback rc;
			ba->com_make_default_header(&rc, BS->uid, sizeof(ReadCallback), FID_READ_CALLBACK);
			rc.length = MIN(length, MESSAGE_LENGTH);

			for(uint8_t i = 0; i < rc.length; i++) {
				rc.message[i] = bc->out[bc->out_start];
				bc->out_start = (bc->out_start + 1) % BUFFER_SIZE;
			}

			for(uint8_t i = rc.length; i < MESSAGE_LENGTH; i++) {
				rc.message[i] = 0;
			}

			ba->send_blocking_with_timeout(&rc,
										   sizeof(ReadCallback),
										   *ba->com_current);
		}

		if(bc->frame_readable_cb_frame_size > 0 && !bc->frame_readable_cb_already_sent && length >= bc->frame_readable_cb_frame_size) {
			bc->frame_readable_cb_already_sent = true;
			FrameReadableCallback fac;
			ba->com_make_default_header(&fac, BS->uid, sizeof(FrameReadableCallback), FID_FRAME_READABLE_CALLBACK);
			fac.frame_count = length / bc->frame_readable_cb_frame_size;
			ba->send_blocking_with_timeout(&fac,
										   sizeof(FrameReadableCallback),
										   *ba->com_current);
        }

		if(bc->error != 0) {
			ErrorCallback ec;
			ba->com_make_default_header(&ec, BS->uid, sizeof(ErrorCallback), FID_ERROR_CALLBACK);
			ec.error = bc->error;

			ba->send_blocking_with_timeout(&ec,
										   sizeof(ErrorCallback),
										   *ba->com_current);

			bc->error = 0;
		}
	}
}

void invocation(const ComType com, const uint8_t *data) {
	switch(((StandardMessage*)data)->header.fid) {
		case FID_READ:                                      read(com, (Read*)data, MESSAGE_LENGTH); break;
		case FID_WRITE:                                     write(com, (Write*)data); break;
		case FID_ENABLE_READ_CALLBACK:                      enable_read_callback(com, (EnableReadCallback*)data); break;
		case FID_DISABLE_READ_CALLBACK:                     disable_read_callback(com, (DisableReadCallback*)data); break;
		case FID_IS_READ_CALLBACK_ENABLED:                  is_read_callback_enabled(com, (IsReadCallbackEnabled*)data); break;
		case FID_SET_CONFIGURATION:                         set_configuration(com, (SetConfiguration*)data); break;
		case FID_GET_CONFIGURATION:                         get_configuration(com, (GetConfiguration*)data); break;
		case FID_SET_BREAK_CONDITION:                       set_break_condition(com, (SetBreakCondition*)data); break;
		case FID_SET_FRAME_READABLE_CALLBACK_CONFIGURATION: set_frame_readable_callback_configuration(com, (SetFrameReadableCallbackConfiguration*)data); break;
		case FID_GET_FRAME_READABLE_CALLBACK_CONFIGURATION: get_frame_readable_callback_configuration(com, (GetFrameReadableCallbackConfiguration*)data); break;
		case FID_READ_FRAME:                                read(com, (Read*)data, BC->frame_readable_cb_frame_size);
		default: BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com); break;
	}
}

void read(const ComType com, const Read *data, const uint8_t length) {
	BrickContext *bc = BC;
	BrickletAPI *ba = BA;

	ReadReturn rr;

	rr.header         = data->header;
	rr.header.length  = sizeof(ReadReturn);

	if(bc->read_callback_enabled) {
		/*
		 * If read callback is enabled then calling the read() function always
		 * returns zero data.
		 */
		rr.length = 0;
		ba->send_blocking_with_timeout(&rr, sizeof(ReadReturn), com);

		return;
	}

	rr.length = MIN(MIN(size_out(), MESSAGE_LENGTH), length);

	for(uint8_t i = 0; i < rr.length; i++) {
		rr.message[i] = bc->out[bc->out_start];
		bc->out_start = (bc->out_start + 1) % BUFFER_SIZE;
	}

	for(uint8_t i = rr.length; i < MESSAGE_LENGTH; i++) {
		rr.message[i] = 0;
	}

	bc->frame_readable_cb_already_sent = false;

	ba->send_blocking_with_timeout(&rr, sizeof(ReadReturn), com);
}

void write(const ComType com, const Write *data) {
	BrickContext *bc = BC;
	uint8_t length = MIN(data->length, MESSAGE_LENGTH);
	uint8_t i;
	for(i = 0; i < length; i++) {
		if(((bc->in_end + 1) % BUFFER_SIZE) == bc->in_start) {
			break;
		}

		bc->in[bc->in_end] = data->message[i];
		bc->in_end = (bc->in_end + 1) % BUFFER_SIZE;
	}

	WriteReturn wr;
	wr.header        = data->header;
	wr.header.length = sizeof(WriteReturn);
	wr.written       = i;

	BA->send_blocking_with_timeout(&wr, sizeof(WriteReturn), com);
}

void enable_read_callback(const ComType com, const EnableReadCallback *data) {
	BC->frame_readable_cb_frame_size = 0;
	BC->read_callback_enabled = true;
	BA->com_return_setter(com, data);
}

void disable_read_callback(const ComType com, const DisableReadCallback *data) {
	BC->read_callback_enabled = false;
	BA->com_return_setter(com, data);
}

void is_read_callback_enabled(const ComType com, const IsReadCallbackEnabled *data) {
	IsReadCallbackEnabledReturn ircer;

	ircer.header         = data->header;
	ircer.header.length  = sizeof(IsReadCallbackEnabledReturn);
	ircer.enabled        = BC->read_callback_enabled;

	BA->send_blocking_with_timeout(&ircer, sizeof(IsReadCallbackEnabledReturn), com);
}

void set_configuration(const ComType com, const SetConfiguration *data) {
	BrickContext *bc = BC;
	if((data->parity >= NUM_PARITIES) ||
	   (data->stopbits != 1 && data->stopbits != 2) ||
	   (data->wordlength < 5 || data->wordlength > 8) ||
	   (data->hardware_flowcontrol >= NUM_FLOWCONTROL) ||
	   (data->software_flowcontrol >= NUM_FLOWCONTROL) ||
	   (data->baudrate >= NUM_BAUDRATES)) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
		return;
	}

	bc->parity               = data->parity;
	bc->stopbits             = data->stopbits;
	bc->baudrate             = data->baudrate;
	bc->wordlength           = data->wordlength;
	bc->hardware_flowcontrol = data->hardware_flowcontrol;
	bc->software_flowcontrol = data->software_flowcontrol;
	write_configuration_to_eeprom();
	sc16is740_reconfigure();

	BA->com_return_setter(com, data);
}

void get_configuration(const ComType com, const GetConfiguration *data) {
	BrickContext *bc = BC;
	GetConfigurationReturn gcr;

	gcr.header               = data->header;
	gcr.header.length        = sizeof(GetConfigurationReturn);
	gcr.parity               = bc->parity;
	gcr.stopbits             = bc->stopbits;
	gcr.baudrate             = bc->baudrate;
	gcr.wordlength           = bc->wordlength;
	gcr.hardware_flowcontrol = bc->hardware_flowcontrol;
	gcr.software_flowcontrol = bc->software_flowcontrol;

	BA->send_blocking_with_timeout(&gcr, sizeof(GetConfigurationReturn), com);
}

void set_break_condition(const ComType com, const SetBreakCondition *data) {
	BrickletAPI *ba = BA;
	if(data->break_time == 0) {
		return;
	}
	BC->break_time = data->break_time;

	if(ba->mutex_take(*ba->mutex_twi_bricklet, 0)) {
		ba->bricklet_select(BS->port - 'a');
		uint8_t lcr = sc16is740_read_register(I2C_INTERNAL_ADDRESS_LCR);
		lcr |= (1 << 6); // Enable break control bit: LCR[6] = 1
		sc16is740_write_register(I2C_INTERNAL_ADDRESS_LCR, lcr);
		ba->bricklet_deselect(BS->port - 'a');
		ba->mutex_give(*ba->mutex_twi_bricklet);
	}

	ba->com_return_setter(com, data);
}

void set_frame_readable_callback_configuration(const ComType com, const SetFrameReadableCallbackConfiguration *data) {
	if(data->frame_size != 0) {
		BC->read_callback_enabled = false;
	}
	BC->frame_readable_cb_frame_size = data->frame_size;
	BC->frame_readable_cb_already_sent = false;
	BA->com_return_setter(com, data);
}

void get_frame_readable_callback_configuration(const ComType com, const GetFrameReadableCallbackConfiguration *data) {
	GetFrameReadableCallbackConfigurationReturn gfrccr;

	gfrccr.header               = data->header;
	gfrccr.header.length        = sizeof(GetFrameReadableCallbackConfigurationReturn);
	gfrccr.frame_size           = BC->frame_readable_cb_frame_size;

	BA->send_blocking_with_timeout(&gfrccr, sizeof(GetFrameReadableCallbackConfigurationReturn), com);
}

void write_configuration_to_eeprom(void) {
	BrickContext *bc = BC;
	BrickletAPI *ba = BA;
	uint8_t conf[10] = {0xDE, 0xAD, 0xBE, 0xEF, bc->parity, bc->stopbits, bc->baudrate, bc->wordlength, bc->hardware_flowcontrol, bc->software_flowcontrol};
	ba->bricklet_select(BS->port - 'a');
	ba->i2c_eeprom_master_write(ba->twid->pTwi,
	                            CONFIGURATION_EEPROM_POSITION,
	                            (const char*)conf,
	                            10);
	ba->bricklet_deselect(BS->port - 'a');
}

void read_configuration_from_eeprom(void) {
	BrickContext *bc = BC;
	BrickletAPI *ba = BA;
	uint8_t conf[10];
	ba->bricklet_select(BS->port - 'a');
	ba->i2c_eeprom_master_read(ba->twid->pTwi,
	                           CONFIGURATION_EEPROM_POSITION,
	                           (char*)conf,
	                           10);
	ba->bricklet_deselect(BS->port - 'a');

	if(conf[0] == 0xDE && conf[1] == 0xAD && conf[2] == 0xBE && conf[3] == 0xEF) {
		bc->parity = conf[4];
		bc->stopbits = conf[5];
		bc->baudrate = conf[6];
		bc->wordlength = conf[7];
		bc->hardware_flowcontrol = conf[8];
		bc->software_flowcontrol = conf[9];
	}
}
