{{/* Create a default fully qualified app name. */}}
{{- define "demo.fullname" -}}
{{- if eq "default" .Values.global.nameSuffix }}
{{- .Chart.Name }}
{{- else }}
{{- printf "%s-%s" .Chart.Name .Values.global.nameSuffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "demo.metricsname" -}}
{{ include "demo.fullname" . }}-metrics
{{- end }}

{{- define "demo.protocname" -}}
{{ include "demo.fullname" . }}-protoc
{{- end }}

{{- define "demo.commonlabels" -}}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "demo.podlabels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "demo.fullname" . }}
{{- end }}

{{- define "demo.servicelabels" -}}
{{ include "demo.commonlabels" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "demo.fullname" . }}
{{- end }}

{{- define "demo.metricslabels" -}}
{{ include "demo.commonlabels" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "demo.metricsname" . }}
{{- end }}

{{- define "demo.protoclabels" -}}
{{ include "demo.commonlabels" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "demo.protocname" . }}
{{- end }}

{{/* Return demo imagename */}}
{{- define "demo.imagename" -}}
{{- printf "%s/%s/%s:%s" .Values.image.dockerRegistry .Values.image.dockerRepo .Values.image.dockerImage .Values.image.dockerTag }}
{{- end }}

