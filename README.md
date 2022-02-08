# upload-files-to-static-rdf-server-action

This action will try to upload the given files to the static-rdf-server at given host.

## Inputs

## `ontology-type`

**Required** The type of the ontology. This decides the folder where the ontology will be served out of.

## `ontology`

**Required** The type of the ontology. This decides the folder where the ontology will be served out of.

## `rdf-file`

**Required** The file (turtle) with the RDF representation of the ontology.

## `html-file`

**Required** The file (html) with the HTML representation of the ontology.

## `html-file-language`

**Required** The language (content-language, ISO 639-1) of the html-file.

## `host`

**Required** The url to the host.

## `api-key`

**Required** A valid API-key. (Should be stored in your repo's secrets.)

## Outputs

## `status-code`

The output from the upload command. None if successful.

## Example usage

```Shell
uses: Informasjonsforvaltning/upload-files-to-static-rdf-server-action@v1.0.0-alpha.2
with:
  ontology-type: "vocabulary"
  rdf-file: "vocabularies/my-ontolgy.ttl"
  html-file: "vocabularies/my-ontolgy-en.html"
  html-file-language: "en"
  host: "https://example.com"
  api-key: ${{ secrets.API_KEY }}
```
