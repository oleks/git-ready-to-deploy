#!/usr/bin/env bash

# This file was generated from an m4 template.
syscmd(`date -u --iso-8601=minutes |
  sed "s/^/# Generation date-time (ISO 8601): /"')dnl
syscmd(`git remote get-url origin |
  tr ":" "/" |
  sed "s/^git@/https:\\/\\//" |
  sed "s/\\.git$//" |
  sed "s/^/# Git repository URL: /"')dnl
syscmd(`git rev-parse HEAD | sed "s/^/# Commit ID: /"')dnl

syscmd(`perl -pe "chomp if eof" LICENSE |
  sed "s/^/# /"')

set -euo pipefail

failcode=1

nlines=$(git status . --porcelain | wc -l)
if [ ${nlines} -ne 0 ] ; then
  cat <<EOF
#####################################################
# Nice! You have changes. Now commit or stash them. #
#####################################################
EOF
  git status .
  exit ${failcode}
fi

echo "Let me check your remote.."
git remote update

nlines=$(git cherry | grep "^+" | wc -l)
if [ ${nlines} -ne 0 ] ; then
  cat <<EOF
#####################################
# Nice! You have commits. Now push. #
#####################################
EOF
  git status .
  exit ${failcode}
fi

echo "Looks like you are up-to-date."
