#!/bin/bash

echo "Starting Jekyll with livereload..."

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload

