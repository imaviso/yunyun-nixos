#!/bin/sh
grim -g "$(slurp)" "tmp.png" && tesseract -l eng "tmp.png" - | wl-copy && rm "tmp.png"
