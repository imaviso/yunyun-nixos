#!/bin/sh
grim -g "$(slurp)" "tmp.png" && tesseract -l jpn "tmp.png" - | wl-copy && rm "tmp.png"
