curl -sfL https://get.k3s.io | sh -
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER ~/.kube/config
chmod 600 ~/.kube/config && export KUBECONFIG=~/.kube/config

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

kubectl get pod -n argocd
kubectl get svc -n argocd

# get generated password
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo

# forward web-server port and proceed without https
# kubectl port-forward svc/argocd-server -n argocd 8080:443 

# This will make local ssh port forwarding. Open at http://localhost:8080 
# ssh -fNT -L 8080:localhost:8080 root@<ip_address>

# If you want to expose argocd web server, create ingress with `traefik`
