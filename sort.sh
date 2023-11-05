#!/bin/zsh

#usage: ./sort.sh | sort > sorted.txt
#       tail -20 sorted.txt

#search_dir=/Users/mcd/Documents/non-fiction/recipes/got/mcd/the-new-kitchen-cookbook
#for entry in "$search_dir"/*/*

for entry in ./appetizers/* ./cookies/* ./pie/* ./rice/* ./salad/* ./soup/* ./vegetables/* ./bread/* ./fish/* ./meat/* ./pasta/* ./poultry/* ./quick-bread/* ./roots/* ./sweets/*
do
  echo `git log --diff-filter=A --follow --format=%aI -- $entry | tail -1` "$entry"
done
