#!/bin/bash -l
ontology_type=$1
ontology=$2
files=$3
host=$4
api_key=$5
url="${host}/${ontology_type}/${ontology}"

while IFS= read -r file_args
do
    file=$(echo $file_args | cut -d " " -f1)
    file_type=$(echo $file_args | cut -d " " -f2)
    file_language=$(echo $file_args | cut -d " " -f3)
    file_name=$(echo $file_args | cut -d " " -f4)
    if [[ "$file" != "" ]] && [[ "$file_type" != "" ]] && [[ "$file_language" != "" ]]
    then
        filename_arg=""
        if [[ "$file_name" != "" ]]
        then
            filename_arg="filename=$file_name;"
        fi
        echo "Uploading $file with type $file_type and content-language $file_language to folder $ontology_type at $url  "
        status_code=$(curl --write-out '%{http_code}' --silent --output /dev/null \
        -H "X-API-KEY: $api_key" \
        -F "ontology-file=@$file;type=$file_type;${filename_arg}headers=\"content-language: $file_language\"" \
        -X PUT $url)
        if [[ $status_code -eq 201 ]]
        then
            echo "Success: Ontology created."
        elif [[ $status_code -eq 204 ]]
        then
            echo "Success: Ontology updated."
        else
            echo "Error: Got status code ${status_code}"
            exit 1
        fi
    elif [[ "$file_args" != "" ]]
    then
        echo "Bad input: '$file_args'"
        exit
    fi
done <<< $files

exit 0
