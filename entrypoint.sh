#!/bin/sh -l
ontology_type=$1
rdf_file=$2
html_file=$3
host=$4
api_key=$5
url="${host}/${ontology_type}/upload-files"

echo "Posting $rdf_file and $html_file to folder $ontology_type at $url  "
status_code=$(curl --write-out '%{http_code}' --silent --output /dev/null \
 -H "X-API-KEY: $api_key" \
 -H "Content-Type: multipart/form-data" \
 -F "ontology-rdf-file=@$rdf_file;type=text/turtle" \
 -F "ontology-html-file=@$html_file;type=text/html" \
 -X POST $url)
if [ $status_code -ne 201 ] ; then
    echo "Error: Got status code ${status_code}"
    exit 1
fi
