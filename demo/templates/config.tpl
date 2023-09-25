{{/* Return demo service config */}}
{{- define "demo.service.config" -}}
http_port: {{ .Values.container.httpPort }}
rpc_port: {{ .Values.container.rpcPort }}
metric_port: {{ .Values.container.metricsPort }}
{{- end -}}
