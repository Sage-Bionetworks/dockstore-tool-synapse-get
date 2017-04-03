#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "synapse-get"
label: "Synapse get tool"

cwlVersion: v1.0

dct:creator:
  "@id": "http://orcid.org/0000-0001-9758-0176"
  foaf:name: James Eddy
  foaf:mbox: "mailto:james.a.eddy@gmail.com"

requirements:
- class: DockerRequirement
  dockerPull: quay.io/jaeddy/dockstore-tool-synapse-get:1.6.1--1

inputs:
  config_file:
    type: File
    inputBinding:
      position: 1

  synapse_id:
    inputBinding:
      position: 2

outputs:
  file_path:
    type: stdout

baseCommand: ["bash", "/usr/local/bin/synapse_get"]
