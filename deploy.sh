#!/bin/bash
# Ensure that we are in the correct directory.
cd /home/elijah/Documents/GitHub/blogsite/

# Remove existing public files (not strictly necessary).
rm -R public

# The “hugo” command will render the website out into the public directory.
hugo

# Copy the contents of the public folder to the Cloud Storage Bucket
gcloud storage rsync public gs://blog.probablyquill.com/ --cache-control max-age=0 --recursive --content-language en
