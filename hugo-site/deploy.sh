#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

cd ..

rm -rf fonts
rm -rf docs
rm -rf svg
rm -rf img

cd hugo-site

rm -rf public

hugo --minify

mv -f public/* ..

cd ..

touch .nojekyll

git add --all

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push
