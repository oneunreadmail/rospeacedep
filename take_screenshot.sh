#!/bin/bash

# Start Hugo server in the background
hugo server &

# Get the process ID of the Hugo server
HUGO_PID=$!

# Wait for the server to start
sleep 1

# Remove output file if exists
[ ! -e screenshot.png ] || rm screenshot.png

# Take a screenshot
shot-scraper http://localhost:1313/p/ -o screenshot.png

# Stop the Hugo server
kill $HUGO_PID
