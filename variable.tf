/**
idp 기본 파라미터.
url
owner
owner_id
namespace
workspace
workspace_id
cpu
memory
disk
init_script
**/

variable "use_kubeconfig" {
  type        = bool
  description = <<-EOF
  Use host kubeconfig? (true/false)

  Set this to false if the Coder host is itself running as a Pod on the same
  Kubernetes cluster as you are deploying workspaces to.

  Set this to true if the Coder host is running outside the Kubernetes cluster
  for workspaces.  A valid "~/.kube/config" must be present on the Coder host.
  EOF
  default     = false
}

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace to create workspaces in (must exist prior to creating workspaces). If the Coder host is itself running as a Pod on the same Kubernetes cluster as you are deploying workspaces to, set this to the same namespace."
  default     = "dxukr"
}

variable "owner" {
  type    = string
  default = "owner"
}
variable "owner_id" {
  type    = string
  default = "onwer-id"
}
variable "workspace" {
  type    = string
  default = "worksapce-name"
}
variable "workspace_id" {
  type    = string
  default = "0001"
}

variable "disk" {
  type    = number
  default = 8
}
variable "memory" {
  type    = number
  default = 8
}
variable "cpu" {
  type    = number
  default = 4
}
variable "url" {
  type    = string
  default = "idp-unkown.k3s.kr"

}
variable "init_script" {
  type    = string
  default = "git clone https://github.com/dxukr/jupyterlab-k8s.git"
}
locals {
  name       = "idp"
  mount_path = "/home/jovyan"
  image      = "registry.gitlab.com/dxi/repo/dxu-notebook:3.11_latest"
  initScript = <<-EOT
    {INIT_SCRIPT}
    start-notebook.sh --NotebookApp.token=''  --NotebookApp.password=''
    EOT
}
