# Raw

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Utility helm chart for deploying arbitrary kubernetes manifests

This chart is a port to Helm v3 of the original [raw chart](https://github.com/helm/charts/tree/master/incubator/raw). The chart works for the most parts the same (keep it as simple as possible). So all credits to the original authors. Don't forget to check the library functions, these can be used as well within your templates.
It is under active development and may contain bugs/unfinished documentation.

**Homepage:** <https://github.com/defenseunicorns/helm-charts/tree/master/charts/raw>

## Source Code

* <https://github.com/defenseunicorns/helm-charts/tree/master/charts/raw>

# Examples

See the following examples to see the full potential:

```
global:
  imageRegistry: "company-registry/"

# Consider this Image tag Mainly. But considers global imageRegistry, if set by parent chart.
image:
  registry: docker.io
  repository: bitnami/apache

templates:
  - |
      apiVersion: v1
      kind: Pod
      metadata:
        name: static-web
        labels:
          role: myrole
      spec:
        containers:
          - name: web
            image: \{\{ include "lib.utils.globals.image" (dict "image" .Values.image "context" $ ) }}
            ports:
              - name: web
                containerPort: 80
                protocol: TCP
```

A very basic example. But might get you started.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonLabels | object | `{}` | Common Labels are added to each kubernetes resource manifest. |
| overwriteLabels | object | `{}` | Overwrites default labels, but not resource specific labels and common labels |
| resources | list | `[]` | Define resources to be deployed by the raw chart |
| templates | list | `[]` | Define templates which will be executed using the `tpl` function |
