#!/bin/bash

curl -X POST  "https://us-central1-fhir-org-starter-project.cloudfunctions.net/ig-commit-trigger" \
  -H "Content-type: application/json" \
  --data '{"repository": {"full_name": "robeastwood-agency/au-fhir-base"}}'