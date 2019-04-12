#!/usr/bin/env bash
source $(dirname "$0")/sweagle.env

argFileJSON="./config/Envs.json"
# Sweagle path to store css, it is defined by each of the node names separated by ,
nodePath=$1

function jsonValue() {
   key=$1
   num=$2
   awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/\042'$key'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

#echo -e "\n**********"
#echo "*** Transform CSS to JSON"
#head -101 $argFileCSS > ./temp.css
#cssjson $argFileCSS -o $argFileJSON
#rm ./temp.css

#echo -e "\n**********"
#echo "*** Get background color value for debugging only"

#backgroundColor=$(cat $argFileJSON  | jsonValue $argColor 1)
#echo "*** Value of Background Color = "$backgroundColor

#echo -e "\n**********"
#echo "*** Transfer CSS config file to Sweagle"
#$sweagleScriptDir/uploadDirToSweagle.sh $nodePath,css $argFileJSON
# remove temporary json file
#rm $argFileJSON

echo -e "\n**********"
echo "*** Transfer JSON config file to Sweagle"
$sweagleScriptDir/uploadDirToSweagle.sh $nodePath,json $argDirJSON
