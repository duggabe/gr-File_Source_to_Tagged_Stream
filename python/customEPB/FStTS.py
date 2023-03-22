#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright 2023 Barry E Duggan.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

import numpy as np
from gnuradio import gr
import pmt
import os.path
import sys

class FStTS(gr.sync_block):
    def __init__(self, FileName='None', Pkt_len=252):
        gr.sync_block.__init__(
            self,
            name='File Source to Tagged Stream',
            in_sig=None,
            out_sig=[np.uint8])
        self.FileName = FileName
        self.Pkt_len = Pkt_len
        self._eof = False
        self.indx = 0
        if (os.path.exists(self.FileName)):
            # open input file
            self.f_in = open (self.FileName, 'rb')
        else:
            print(FileName, 'does not exist')
            self._eof = True

    def work(self, input_items, output_items):
        while (not (self._eof)):
            buff = self.f_in.read (self.Pkt_len)
            b_len = len(buff)
            if b_len == 0:
                print ('End of file')
                self._eof = True
                self.f_in.close()
                break
            key0 = pmt.intern("packet_len")
            val0 = pmt.from_long(b_len)
            self.add_item_tag(0, # Write to output port 0
                self.indx,   # Index of the tag
                key0,   # Key of the tag
                val0    # Value of the tag
                )
            self.indx += b_len
            i = 0
            while (i < b_len):
                output_items[0][i] = buff[i]
                i += 1
            return (b_len)
        return (0)
