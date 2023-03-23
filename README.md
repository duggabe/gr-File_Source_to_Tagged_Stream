# gr-File_Source_to_Tagged_Stream

Reads a binary file and produces a stream output with 'packet_len' tags for GNU Radio. Functionally it replaces a 'File Source' block and a 'Stream to Tagged Stream' block. The advantage of this block is that when the input file size is not an exact multiple of the selected packet length, the remainder at the end of the file is not lost in the 'Stream to Tagged Stream' buffer.

** This is a work in progress with limited testing so far**  
Any feedback would be appreciated.

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
