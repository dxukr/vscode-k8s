#!/bin/bash
CMD=terraform
export TF_VAR_namespace=dxukr

$CMD init
$CMD plany
$CMD apply
