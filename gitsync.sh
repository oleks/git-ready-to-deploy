#!/usr/bin/env bash

# Copyright (c) 2016 Oleks <oleks@oleks.info>
# See also https://github.com/oleks/gitsync
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

gitstatus=$(git status .)
set +e
echo "${gitstatus}" | grep "Your branch is up-to-date" >/dev/null
code=$?
set -e

if [ ${code} -ne 0 ] ; then
  cat <<EOF
#####################################
# Nice! You have commits. Now push. #
#####################################
EOF
  git status .
  exit ${failcode}
fi

echo "Looks like you are up-to-date."
