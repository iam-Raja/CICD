# Jenkins

**Plugins:**
* Pipeline stage view
* AnsiColor
* Pipeline Utility Steps
* Nexus Artifact Uploader
* Rebuilder

**Configure aws on matser with non-root**
* After downloading plugins and aws configure restart jenkins
```
sudo systemctl restart jenkins
```

**Node-To-Kube-Authenicate**
```
aws eks update-kubeconfig --region <region-name> --name <Cluster-name>
```