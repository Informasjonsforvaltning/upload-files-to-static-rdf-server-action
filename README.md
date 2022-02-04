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

## `host`

**Required** The url to the host.

## `api-key`

**Required** A valid API-key. (Should be stored in your repo's secrets.)

## Outputs

## `status-code`

The output from the upload command. None if successful.

## Example usage

```Shell
uses: actions/upload-files-to-static-rdf-server-action@v1.0.0-alpha.1
with:
  ontology-type: "vocabulary"
  rdf-file: "vocabularies/my-ontolgy.ttl"
  html-file: "vocabularies/my-ontolgy.html"
  host: "https://example.com"
  api-key: ${{ secrets.API_KEY }}
```
