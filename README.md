# GitHub Actions for Okteto Cloud

## Automate your development workflows using Github Actions and Okteto Cloud
GitHub Actions gives you the flexibility to build an automated software development workflows. With GitHub Actions for Okteto Cloud you can create workflows to build, deploy and update your applications in [Okteto Cloud](https://cloud.okteto.com).

Get started today with a [free Okteto Cloud account](https://cloud.okteto.com)!

## Github Action for Applying Resources in Okteto Cloud

You can use this action to create config maps in your Okteto Cloud namespace. This is equivalent to running `kubectl create configmap <name> --from-file=<path>` or `kubectl configmap generic <name> --from-literal=<literal>`.

## Inputs

### `name`

Configmap name.

### `path`

Path to files that will be included as configmap. Can be a file or a directory. If not specified, it will seek for literal.

### `literal`

Literal that will be included as configmap. If not specified, it will seek for path.

### `namespace`

The Okteto namespace to use. If not specified it will use the namespace specified by the `namespace` action.

## Example usage

This example runs the login action, activates a namespace and creates a configmap.

```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@master
      
    - uses: okteto/login@master
      with:
        token: ${{ secrets.OKTETO_TOKEN }}
    
    - name: "Activate personal namespace"
      uses: okteto/namespace@master
      with:
        name: cindylopez

    - name: "Create my-configmap"
      uses: elreclamador/okteto-configmap@master
      with:
        name: my-configmap
        path: config.txt
```

