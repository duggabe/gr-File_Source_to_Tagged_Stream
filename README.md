# gr-File_Source_to_Tagged_Stream

Reads a binary file and produces a stream output with 'packet_len' tags for GNU Radio. Functionally it replaces a [File Source](https://wiki.gnuradio.org/index.php?title=File_Source) block, a [Stream to Tagged Stream](https://wiki.gnuradio.org/index.php?title=Stream_to_Tagged_Stream) block, and parts of a [Burst_Shaper](https://wiki.gnuradio.org/index.php?title=Burst_Shaper) block. The advantage of this block is that when the input file size is not an exact multiple of the selected packet length, the remainder at the end of the file is not lost in the 'Stream to Tagged Stream' buffer. This block performs the following functions:
* Send a preamble to allow the receiver to synchronize.
* Send the selected file with "packet_len" tags.
* Send a post-file filler to assure that any buffers have been flushed.

## Development History

During the development of the [Packet Communications](https://wiki.gnuradio.org/index.php?title=Packet_Communications) tutorial I decided to make an Out of Tree block to take the place of the File Source and the Stream to Tagged Stream blocks. This is that module.

After that I worked on the [File transfer using Packet and AFSK](https://wiki.gnuradio.org/index.php?title=Simulation_example:_FSK#File_transfer_using_Packet_and_AFSK) tutorial and made several improvements to the Embedded Python Block.

Next came follow-on work to the Packet Communications tutorial which resulted in the [File transfer using Packet and BPSK](https://wiki.gnuradio.org/index.php?title=File_transfer_using_Packet_and_BPSK) tutorial. It added several features such as Base64 encoding of the data, sending the originating filename in the postamble, and specifying the input file on the Python command line.

## Recommendations

This module works as is, but if you want the additional features of the Embedded Python Block from the BPSK tutorial, it can be copied from the [pkt_xmt.grc](https://raw.githubusercontent.com/duggabe/gr-control/main/Transmitters/pkt_xmt.grc) flowgraph and modified to suit your needs.

## Installation

1. Open a terminal window.
2. Change to the home directory.  
```
cd ~/  
```
3. If you don't have 'git', enter  
```
sudo apt install git  
```
4. Execute the following commands: 
 
  `cd`  
  `git clone https://github.com/duggabe/gr-File_Source_to_Tagged_Stream.git`  
  `cd ~/gr-File_Source_to_Tagged_Stream`  
  `mkdir build`  
  `cd build`  
  `cmake ../`  
  `make`  
  `sudo make install`  
  `sudo ldconfig`  

## Using the block in GRC

After starting "gnuradio-companion", the "File Source to Tagged Stream" block will be listed in the Block Tree Panel under the "customEPB" group.

## Example flowgraph

An example flowgraph for sending packets is shown in the `examples` folder.
