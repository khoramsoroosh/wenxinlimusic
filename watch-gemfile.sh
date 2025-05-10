#!/bin/bash

echo "Watching Gemfile and Gemfile.lock for changes..."

# If either Gemfile or Gemfile.lock change, trigger rebuild
ls Gemfile Gemfile.lock | entr -r docker-compose up --build

