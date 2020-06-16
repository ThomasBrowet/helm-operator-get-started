az aks get-credentials --resource-group gitops --name aks01

kubectl create ns flux-system

helm repo add fluxcd https://charts.fluxcd.io
helm upgrade -i flux fluxcd/flux --wait \
--namespace flux-system \
--set git.url=git@github.com:ThomasBrowet/helm-operator-get-started \
--set additionalArgs={--sync-garbage-collection}


helm upgrade -i helm-operator fluxcd/helm-operator --wait \
--namespace flux-system \
--set git.ssh.secretName=flux-git-deploy \
--set helm.versions=v3

fluxctl identity --k8s-fwd-ns flux-system

https://github.com/ThomasBrowet/helm-operator-get-started


fluxctl sync --k8s-fwd-ns flux-system


# Deployment.yaml

http://localhost:8080/

https://github.com/ThomasBrowet/docker-sample-app

https://github.com/ThomasBrowet/helm-operator-get-started/commits/master

http://localhost:8080/




