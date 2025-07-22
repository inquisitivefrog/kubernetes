
tim@Tims-MBP kubeadm % curl -s https://k8s.gcr.io/releases/$(curl -s https://k8s.gcr.io/release/stable) | base64 -d | sudo tee /usr/local/bin/kubeadm > /dev/null
Password:
tim@Tims-MBP kubeadm % ls -l
total 8
-rw-r--r--  1 tim  staff  3369 Nov  1 09:07 README.brew_install.txt
tim@Tims-MBP kubeadm % which kubeadm
kubeadm not found
tim@Tims-MBP kubeadm % sudo chmod +x /usr/local/bin/kubeadm  
tim@Tims-MBP kubeadm % ls -l /usr/local/bin/kube*           
-rwxr-xr-x  1 root  admin   0 Nov  1 09:09 /usr/local/bin/kubeadm
lrwxr-xr-x  1 tim   admin  43 Nov  1 09:05 /usr/local/bin/kubectl -> ../Cellar/kubernetes-cli/1.31.2/bin/kubectl
lrwxr-xr-x@ 1 root  admin  55 Oct 31 14:11 /usr/local/bin/kubectl.docker -> /Applications/Docker.app/Contents/Resources/bin/kubectl

