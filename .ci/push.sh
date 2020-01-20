#!/bin/sh

setup_git() {
  git config --global user.email "ci@@ninjaneers.de"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout master
  git add . *.yaml
  git commit --message "Update index [skip ci]"
}

upload_files() {
  git remote add remote https://${GH_TOKEN}@github.com/ninjaneers-team/charts.git > /dev/null 2>&1
  git push --quiet remote master
}

setup_git
commit_website_files
upload_files