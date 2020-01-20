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
  git push --quiet origin master
}

setup_git
commit_website_files
upload_files