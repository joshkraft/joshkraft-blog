#!/bin/sh
set -e
cd $(dirname "$0")/..
cd _notebooks/

ERRORS=""

for file in *.ipynb
do
    if [ "${file}" = "2020-21-10-Candidate-Tweets.ipynb" ]
    then
        papermill --kernel python3 "${file}" "${file}"
        echo "Sucessfully refreshed ${file}\n\n\n\n"
        
    else
    then
        echo "Skipping ${file}"
done

if [ -z "$ERRORS" ]
then
    echo "::set-output name=error_bool::false"
else
    echo "These files failed to update properly: ${ERRORS}"
    echo "::set-output name=error_bool::true"
    echo "::set-output name=error_str::${ERRORS}"
fi
