#!/bin/sh
alias kctl='kubectl --kubeconfig ~/.kube/config'
alias kcgn="kubectl --kubeconfig ~/.kube/config get nodes"
alias kcci="kubectl --kubeconfig ~/.kube/config cluster-info"
alias kpods="kubectl --kubeconfig ~/.kube/config get pods --all-namespaces"

alias flux-reconcile="flux reconcile source git flux-system" 
alias flux-log="flux logs"

