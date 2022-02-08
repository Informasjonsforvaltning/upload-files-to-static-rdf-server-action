# upload-files-to-static-rdf-server-action

This action will try to upload the given files to the static-rdf-server at given host.

## Inputs

## `ontology-type`

**Required** The type of the ontology. This decides the folder where the ontology will be served out of.

## `ontology`

**Required** The type of the ontology. This decides the folder where the ontology will be served out of.

## `file`

**Required** The file with a representation of the ontology.

## `file-type`

**Required** The  type of the file .

## `file-language`

**Required** The language (content-language, ISO 639-1) of the file.

## `host`

**Required** The url to the host.

## `api-key`

**Required** A valid API-key. (Should be stored in your repo's secrets.)

## Outputs

## `status-code`

The output from the upload command. None if successful.

## Example usage

```Shell
uses: Informasjonsforvaltning/upload-files-to-static-rdf-server-action@v2
with:
  ontology-type: "vocabulary"
  ontology: "hello-world"
  file: "testfiles/hello-world.ttl"
  file-type: "text/turtle"
  file-language: "en"
  host: "https://example.com"
  api-key: ${{ secrets.API_KEY }}
```
