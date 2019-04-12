#!/usr/bin/env bash
source $(dirname "$0")/sweagle.env

#env=$1
nodePathEnv="JenkinsCD"
file="./config/Envs.json"

#$sweagleScriptDir/UploadConfig.sh $nodePathUI
$sweagleScriptDir/uploadFileToSweagle.sh $nodePathEnv $file
