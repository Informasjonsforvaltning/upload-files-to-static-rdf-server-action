#!/bin/sh -l
ontology_type=$1
ontology=$2
rdf_file=$3
html_file=$4
html_file_language=$5
host=$6
api_key=$7
url="${host}/${ontology_type}/${ontology}"

echo "Uploading $rdf_file and $html_file to folder $ontology_type at $url  "
status_code=$(curl --write-out '%{http_code}' --silent --output /dev/null \
 -H "X-API-KEY: $api_key" \
 -H "Content-Type: multipart/form-data" \
 -F "ontology-rdf-file=@$rdf_file;type=text/turtle" \
 -F "ontology-html-file=@$html_file;type=text/html;headers=\"content-language: $html_file_language\"" \
 -X PUT $url)
if [ $status_code -ne 204 ] ; then
    echo "Error: Got status code ${status_code}"
    exit 1
fi
