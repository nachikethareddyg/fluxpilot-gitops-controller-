#setup cluster 1 and 2:

1.sudo apt update

2.curl -sfL https://get.k3s.io | sh -
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config

3.sudo mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

4.echo 'export KUBECONFIG=$HOME/.kube/config' >> ~/.bashrc
source ~/.bashrc

5.kubectl get nodes

6.curl -s https://fluxcd.io/install.sh | sudo bash
7.flux --version

#setup controller:
1.sudo apt update
2.sudo snap install tree 

2.git clone https://github.com/<your-username>/fluxpilot-gitops.git

3.git add .
git commit -m "Initialize fluxpilot-gitops with app + monitoring + clusters"
git push origin main

If rejected:

git pull --rebase origin main
git push origin main


#from cluster 1:

1.flux bootstrap github \
  --owner=godstone2003 \
  --repository=fluxpilot-gitops \
  --branch=main \
  --path=clusters/cluster1 \
  --personal

#from cluster 2:
2.flux bootstrap github \
  --owner=godstone2003 \
  --repository=fluxpilot-gitops \
  --branch=main \
  --path=clusters/cluster2 \
  --personal

##if fails:
STEP 5️ Reconcile (Both Clusters)
Cluster1
vagrant ssh cluster1
flux reconcile source git flux-system
flux reconcile kustomization flux-system

Cluster2
vagrant ssh cluster2
flux reconcile source git flux-system
flux reconcile kustomization flux-system

# Verify Deployments
# Cluster1 ansd Cluster2
vagrant ssh cluster1
flux get kustomizations
kubectl get pods