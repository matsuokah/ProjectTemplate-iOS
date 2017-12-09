#!/bin/sh

XCODE_URL="https://itunes.apple.com/jp/app/id497799835?mt=8"

xcodebuild -version > /dev/null 2>&1

print_and_say () {
  echo $1
  say $1
}

if [ $? -eq 0 ];
then
  echo Xcode is installed.
else
  print_and_say "Xcode is not intalled, Please install Xcode"
  open -a Safari "$XCODE_URL"
  exit 1
fi
