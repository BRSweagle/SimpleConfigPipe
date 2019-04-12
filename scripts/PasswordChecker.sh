#!/usr/bin/env bash

argCustomValidator="PasswordChecker"
$(dirname "$0")/checkCustomConfigByMdsValidator.sh $1 $argCustomValidator
retVal=$?

if [ $retVal -ne 0 ]; then
  echo "********** ERROR DESCRIPTION: You have passwords which are not encrypted - please correct"
fi
exit $retVal
