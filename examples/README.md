The example flowgraph str_pkt_21.grc shows how to use this block.

The file source can be any file type of any length. A packet lengths of 60, 384, and 1020 have worked well in testing.

Because sending random binary data can cause errors in the data transmission, it has been found that converting the binary file to [Base64 encoding](https://en.wikipedia.org/wiki/Base64) first, works reliably.

The received file will be stored in "~/gr-File_Source_to_Tagged_Stream/examples/output.tmp". That file will contain up to 'Preamble_len' packets, followed by the transmitted file with Base64 encoding, followed by filler packets.

A Python program has been written to strip those preamble and filler packets and decode the Base64 text:

1. Open a terminal window.
2. Go the the examples directory
```
cd ~/gr-File_Source_to_Tagged_Stream/examples
```
3. Execute the <code>strip_preamble.py</code> program. The last parameter (file name) can be whatever you wish as the output. Use the appropriate file extension!
```
python3 strip_preamble.py output.tmp output.png
```
4. The 'output.png' will be the decoded file.

