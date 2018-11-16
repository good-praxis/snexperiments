# snexperiments
My Snes Experiments

This repository is a container for all the little things I'm trying out in 65182 assembly / and trying to get them to run on bsnes/higan
The toolchain consists of [libsfx](add a link you idiot) and [bsnes-plus](here, too) for debugging.

# Map
## 00 - Blue Screen
It's just a blue screen. Pretty cool, right?
## 01 - switching primary colors
It rotates between red, green and blue every second or so. No real loop.
## 02 - loop counter primary colors
This one actually uses a loop counter for what the 01 does
## 03 - bitwise rotation mood light
This one is supposed to rotate a binary block of #$1F (00011111) through the first two addressed of CGRAM, therefore gradually changing colors. Doesn't work right now
