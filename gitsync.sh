#!/usr/bin/env bash

set -euo pipefail

failcode=1

nstatuslines=$(git status . --porcelain | wc -l)
if [ $nstatuslines -ne 0 ] ; then
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

gitstatus=$(git status .)
set +e
echo "${gitstatus}" | grep "Your branch is up-to-date" >/dev/null
code=$?
set -e

if [ $code -ne 0 ] ; then
  cat <<EOF
#####################################
# Nice! You have commits. Now push. #
#####################################
EOF
  git status .
  exit ${failcode}
fi

echo "Looks like you are up-to-date."
