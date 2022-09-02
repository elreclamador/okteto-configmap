#!/bin/sh
set -e

name=$1
path=$2
literal=$3
namespace=$4
params=""

if [ -n "$path" ]; then
  params="--from-file=$path "
fi

if [ -n "$literal" ]; then
  params="--from-literal=$literal "
fi

if [ -z "$params" ]; then
  echo "config not found"
  return 1
fi

if [ -n "$namespace" ]; then
  params+="--namespace $namespace"
fi

cmd="kubectl create configmap $name $params"

echo "running: $cmd"

kubectl delete configmap "$name" --ignore-not-found

eval $cmd