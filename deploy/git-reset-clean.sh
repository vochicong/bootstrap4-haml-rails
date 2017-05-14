#!/bin/bash
# reset data generated during CI test etc.
git --no-pager diff
git reset --hard
git clean -d -x -f
git status
