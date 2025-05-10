#!/bin/bash
set -e

# Step 1: Build site using Docker
docker-compose build

# Step 2: Copy CNAME file if it exists
cp CNAME _site/ 2>/dev/null || true

# Step 3: Deploy built site to gh-pages branch
cd _site
git init
git checkout -b gh-pages
git remote add origin git@github.com:khoramsoroosh/wenxinlimusic.git
touch .nojekyll
git add .
git commit -m "Deploy site on $(date)"
git push -f origin gh-pages
cd ..

