#!/bin/bash

prt="print_script.sh"
io=$(lsof -p $$ | awk '{print $NF}' | grep $prt)
lbl="label.zpl"
io=${io/$prt/$lbl}

lpr -P ZTC-ZD220-203dpi-ZPL -o raw $io
