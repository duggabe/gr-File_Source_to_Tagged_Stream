The example flowgraph str_pkt_21.grc shows how to use this block.

The file source can be any text file of any length. A packet length of 52 has worked well in testing.

After executing the flowgraph, the "output.txt" file will contain a partial preamble followed by several more, depending on how long it takes the receiver to synchronize; then the file itself; then the post-file filler.

Because sending random binary data can cause errors in the data transmission, it has been found that converting the binary file to [Base64 encoding](https://en.wikipedia.org/wiki/Base64) first works reliably. A post-processing program can be used to strip the preambles and convert the Base64 code back to binary data.

File "DCS_logo.b64" contains the Base64 encoding of the "DCS_logo.png" file.
