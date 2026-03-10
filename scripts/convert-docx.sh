#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Find all .docx files in the repository
for docx_file in $(find . -name '*.docx'); do
  # Define the output markdown file name
  markdown_file="${docx_file%.docx}.md"
  
  # Convert .docx to .md using pandoc
  pandoc "$docx_file" -o "$markdown_file"
  
  # Add the generated markdown file to git
  git add "$markdown_file"
done

# Commit the changes with a message
git commit -m "Convert .docx files to Markdown" || echo "No changes to commit"