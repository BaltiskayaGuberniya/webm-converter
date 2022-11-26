#!/usr/bin/env bash

input="$1"
size=$2
cpu=$3
output=$4

duration=$(ffprobe -i "$input" -show_entries format=duration -v quiet -of csv="p=0" | egrep -o '^[^.]+') 


while [ -z "$size" ] || [ -z "$input" ] || [ "$input" == "--help" ] || [ "$input" == "-help" ] ; do
  echo "Help:
Example 1: webm.sh video.mp4 5
This will produce a roughly 5mb webm from the video.mp4 file, and output it to video.webm
Example 2: webm.sh video.mp4 5 2 out.webm 
This will produce a roughly 5mb webm from the video.mp4 file, use 2 cores to process the output, and name it out.webm"
  exit 1
done

if [ -z "$cpu" ]
then 
	cpu=1
fi

if [ -z "$output" ]
then 
	output="${input%%.*}.webm"
fi



ffmpeg -i "$input" -cpu-used $cpu -map 0:v -c libvpx-vp9 -pass 1 -f null -

ffmpeg -i "$input" -cpu-used $cpu -map 0:v -map 0:a? -pass 2 -crf 30 -b:v $(($size*2**23 / $duration - 64*2**10)) $output

rm -f ffmpeg2pass-0.log
