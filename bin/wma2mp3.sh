#!/bin/bash
#############################################################
# wma2mp3 v0.12
# by Calum and Void Main
#
# e.g. wma2mp3 myfile.wma
# e.g. wma2mp3 myfile.wma myfile2.wma myfile3.wma
# e.g. wma2mp3 "my file.wma" "my file 2.wma" "my file 3.wma"
# e.g. wma2mp3 *.wma
# e.g. wma2mp3 /directory/containing/wma/files
# e.g. wma2mp3 .
#
# http://voidmain.is-a-geek.net/forums/viewtopic.php?t=407
#
# History:
# 16 May 2003 - v0.1 wma2mp3 script created
# 27 August 2005 - v0.11 -aofile had been deprecated, corrected
# 28 August 2005 - v0.12 Added "IFS=" -Void
#############################################################

# Turn off input field separation so filenames with spaces work
IFS=

#############################################################
# Move the conversion process into a function that can
# be called.
# The "&&" makes it so each step must be successful before
# the next step will be done.
#############################################################

function wma2mp3 () {
  if [ ! -f "$1" ]; then
     echo "File $1 not found!"
  else
     mplayer -ao pcm:file="${1%%.[Ww][Mm][Aa]}.wav" "$1" &&
     lame -h -b 192 "${1%%.[Ww][Mm][Aa]}.wav" "${1%%.[Ww][Mm][Aa]}.mp3" &&
     rm -f "${1%%.[Ww][Mm][Aa]}.wav" ||
     echo "There was a problem with the conversion process!"
  fi
}

#############################################################
# Not enough information to compute
#############################################################
if [ $# -lt 1 ]; then
   echo "Syntax: `basename $0` <wmaFilename(s)|wmaDirectory>"
   exit
fi

#############################################################
# Directory was passed so convert all wma files in directory
#############################################################
if [ $# -eq 1 -a -d "$1" ]; then
  for file in $1/*.[Ww][Mm][Aa]
  do
    wma2mp3 "$file"
  done
  exit
fi

#############################################################
# One or more wma files were passed, convert them
#############################################################
for file in $*
do
  wma2mp3 "$file"
done
exit
