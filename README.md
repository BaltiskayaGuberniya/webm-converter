# webm-converter
This shell script lets you convert any video format into a more efficient Webm with vp9 encoding. 
Mandatory parameters:
1 - the input file
2 - The desired size of the output file, in MB
Optional parameters:
3 - The number of processor cores to be used for the operation
4 - The output destination (by default it's the same as the input file destination, but with the extension changed to .webm)

Example 1: webm.sh video.mp4 5
This will produce a roughly 5mb webm from the video.mp4 file, and output it to video.webm
Example 2: webm.sh video.mp4 5 2 out.webm 
This will produce a roughly 5mb webm from the video.mp4 file, use 2 cores to process the output, and name it out.webm"
