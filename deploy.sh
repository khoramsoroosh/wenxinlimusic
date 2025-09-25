#!/bin/bash
set -e

# Config: your GitHub repo
REPO="git@github.com:khoramsoroosh/wenxinlimusic.git"
BRANCH="gh-pages"

# Step 1: Build site using Docker
docker-compose build

# Step 2: Move into the output directory
cd _site

# Step 3: Initialize Git repo if needed
if [ ! -d ".git" ]; then
  git init
fi

# Step 4: Create or switch to gh-pages branch
git checkout -B $BRANCH

# Step 5: Add or update remote origin
if git remote get-url origin > /dev/null 2>&1; then
  git remote set-url origin $REPO
else
  git remote add origin $REPO
fi

# Step 6: Add deployment files
touch .nojekyll
cp ../CNAME . 2>/dev/null || true

# Step 7: Commit and push
git add .
git commit -m "Deploy site on $(date)" || echo "Nothing to commit"
git push -f origin $BRANCH

# Step 8: Return to root
cd ..
