#!/bin/sh
set -e
cd $(dirname "$0")/..
cd _notebooks/

ERRORS=""

for file in *.ipynb
do
    if [ "${file}" = "2020-21-10-Candidate-Tweets.ipynb" ]
    then
        papermill --kernel python3 "${file}" "${file}"; then
        echo "Sucessfully refreshed ${file}\n\n\n\n"
    elif [ "${file}" = "" ]
    then s
        echo "Skipping ${file}"
    else
        echo "ERROR Refreshing ${file}"
        ERRORS="${ERRORS}, ${file}"
    fi
done

if [ -z "$ERRORS" ]
then
    echo "::set-output name=error_bool::false"
else
    echo "These files failed to update properly: ${ERRORS}"
    echo "::set-output name=error_bool::true"
    echo "::set-output name=error_str::${ERRORS}"
fi