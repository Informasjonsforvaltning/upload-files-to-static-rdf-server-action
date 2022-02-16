#!/bin/sh -l
ontology_type=$1
ontology=$2
file=$3
file_type=$4
file_language=$5
host=$6
api_key=$7
url="${host}/${ontology_type}/${ontology}"

echo "Uploading $file with content-language $file_languate to folder $ontology_type at $url  "
status_code=$(curl --write-out '%{http_code}' --silent --output /dev/null \
 -H "X-API-KEY: $api_key" \
 -F "ontology-file=@$file;type=$file_type;headers=\"content-language: $file_language\"" \
 -X PUT $url)
if [ $status_code -eq 201 ]
then
    echo "Success: Ontology created."
    exit 0
elif [ $status_code -eq 204 ]
then
    echo "Success: Ontology updated."
    exit 0
else
    echo "Error: Got status code ${status_code}"
    exit 1
fi
