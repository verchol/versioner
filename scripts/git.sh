#!/bin/bash
action=$1
repourl=$2
folder=$3
echo $folder
git clone $action $repourl $folder
