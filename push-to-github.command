#!/bin/bash
# Push DAWganize site to GitHub
cd "$(dirname "$0")"

# Initialize git if not already done
if [ ! -d ".git" ]; then
  git init
  git config user.name "Suresh Raja"
  git config user.email "sureshraja.cu@gmail.com"
  git add .
  git commit -m "Initial commit: DAWganize landing page"
fi

echo "🚀 Pushing DAWganize site to GitHub..."

git remote remove origin 2>/dev/null
git remote add origin https://github.com/SureshRaja1/dawganize-site.git
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ Done! Site is on GitHub:"
  echo "   https://github.com/SureshRaja1/dawganize-site"
else
  echo ""
  echo "❌ Push failed. Make sure you created the repo at:"
  echo "   https://github.com/new  →  name: dawganize-site"
fi

echo ""
echo "Press any key to close..."
read -n 1
