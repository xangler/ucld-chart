# cloud-demo-service

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| container.httpPort | int | `8080` |  |
| container.ingress | string | `"demo.xxx.com"` |  |
| container.metricsPort | int | `8082` |  |
| container.rpcPort | int | `8081` |  |
| global.nameSuffix | string | `"default"` |  |
| global.replicaCount | int | `3` |  |
| image.dockerImage | string | `"cloud-demo-service"` |  |
| image.dockerRegistry | string | `"registry.xxx.com"` |  |
| image.dockerRepo | string | `"demo"` |  |
| image.dockerTag | string | `"master"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets[0] | string | `"inner"` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podProbe.livenessProbe.failureThreshold | int | `120` |  |
| podProbe.livenessProbe.httpGet.path | string | `"/v1/health"` |  |
| podProbe.livenessProbe.httpGet.port | int | `8080` |  |
| podProbe.livenessProbe.periodSeconds | int | `30` |  |
| podProbe.livenessProbe.successThreshold | int | `1` |  |
| podProbe.livenessProbe.timeoutSeconds | int | `3` |  |
| podProbe.readinessProbe.failureThreshold | int | `30` |  |
| podProbe.readinessProbe.httpGet.path | string | `"/v1/health"` |  |
| podProbe.readinessProbe.httpGet.port | int | `8080` |  |
| podProbe.readinessProbe.periodSeconds | int | `30` |  |
| podProbe.startupProbe.failureThreshold | int | `20` |  |
| podProbe.startupProbe.httpGet.path | string | `"/v1/health"` |  |
| podProbe.startupProbe.httpGet.port | int | `8080` |  |
| podProbe.startupProbe.periodSeconds | int | `10` |  |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| tolerations | list | `[]` |  |

