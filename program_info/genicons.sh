#/bin/bash

# ICO

inkscape -w 16 -h 16 -o OFPApp_16.png OFPApp.svg
inkscape -w 24 -h 24 -o OFPApp_24.png OFPApp.svg
inkscape -w 32 -h 32 -o OFPApp_32.png OFPApp.svg
inkscape -w 48 -h 48 -o OFPApp_48.png OFPApp.svg
inkscape -w 64 -h 64 -o OFPApp_64.png OFPApp.svg
inkscape -w 128 -h 128 -o OFPApp_128.png OFPApp.svg

convert OFPApp_128.png OFPApp_64.png OFPApp_48.png OFPApp_32.png OFPApp_24.png OFPApp_16.png OFPApp.ico

rm -f OFPApp_*.png

inkscape -w 1024 -h 1024 -o OFPApp_1024.png OFPApp.svg

png2icns OFPApp.icns OFPApp_1024.png

rm -f OFPApp_*.png
