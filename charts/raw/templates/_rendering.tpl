{{/*
  raw.resource will create a resource template that can be
  merged with each item in `.Values.resources`.
*/}}
{{- define "raw.labels" -}}
metadata:
  labels: {{- include "lib.utils.common.commonLabels" $ | nindent 4 }}
{{- end }}
