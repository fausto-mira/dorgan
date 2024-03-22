#!/bin/bash

# Check if cwebp is installed
if ! command -v cwebp &> /dev/null; then
    echo "cwebp is not installed. Please install it first."
    exit 1
fi

# Iterate over each .jpeg file in the current directory and convert it to .webp
for file in *.jpeg; do
    if [ -f "$file" ]; then
        filename="${file%.*}"
        cwebp "$file" -q 80 -o "${filename}.webp"
        echo "Converted $file to ${filename}.webp"
    fi
done

echo "Conversion complete."
