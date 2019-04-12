#!/usr/bin/env bash
source $(dirname "$0")/sweagle.env

env=$1
nodePathUI="JenkindsCD"

$sweagleScriptDir/webPortalUploadConfig.sh $nodePathUI
$sweagleScriptDir/uploadFileToSweagle.sh $nodePathEnv ./environments/$env.properties

# Upload all helm yaml configuration, if any for this environment
if [ -d "./environments/$env/helm/nginx-ingress" ]; then
  $sweagleScriptDir/uploadDirToSweagle.sh $nodePathHelm ./environments/$env/helm/nginx-ingress yaml
fi
