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
  user:
    inputBinding:
      position: 1

  password:
    inputBinding:
      position: 2

  synapse_id:
    inputBinding:
      position: 3

outputs:
  get_report:
    type: stdout

baseCommand: ["bash", "/usr/local/bin/synapse_get"]
