az aks get-credentials --resource-group gitops --name aks03

kubectl create ns flux-system

helm repo add fluxcd https://charts.fluxcd.io


helm upgrade -i flux fluxcd/flux --wait \
--namespace flux-system \
--set git.url=git@github.com:ThomasBrowet/helm-operator-get-started

helm upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace flux-system \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3

fluxctl identity --k8s-fwd-ns flux-system

fluxctl sync --k8s-fwd-ns flux-system



   ./ci-mock.sh -r tbrowet/podinfo -b dev