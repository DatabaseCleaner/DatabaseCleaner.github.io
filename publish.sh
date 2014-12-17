#! /usr/bin/env sh

bundle install

# Build the pages
bundle exec middleman build

# Checkout the branch containing the prerendered site
git checkout master
# /build folder will remain since it's untracked

# Replace old files with new ones
ls | grep -v build | xargs rm -rf
mv build/* .

# Send them up to Github
git add .
git commit # enter commit message
git push origin master
# NOTE: the above will not commit & push if there are not changes to the files

# Go back to the previous branch
git checkout -
