#!/bin/sh -l

set -o pipefail

semgrep ci --config "$1" --json --metrics off \
  | jq -r '.results[] | . + { severity: (if .extra.severity == "WARNING" then "warning" elif .extra.severity == "ERROR" then "error" else "notice" end) } | "::\(.severity) file=\(.path),line=\(.start.line),col=\(.start.col),endLine=\(.end.line),endColumn=\(.end.col),title=\(.check_id)::\(.extra.message)"'
