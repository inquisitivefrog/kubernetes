
tim@Tims-MBP Kubernetes % wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml
--2024-12-12 14:38:46--  https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 2606:50c0:8000::154, 2606:50c0:8002::154, 2606:50c0:8003::154, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|2606:50c0:8000::154|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1380640 (1.3M) [text/plain]
Saving to: ‘install.yaml’

install.yaml                                        100%[================================================================================================================>]   1.32M  5.28MB/s    in 0.2s    

2024-12-12 14:38:46 (5.28 MB/s) - ‘install.yaml’ saved [1380640/1380640]

tim@Tims-MBP argoCD % ls -l
total 2704
-rw-r--r--  1 tim  staff  1380640 Dec 12 14:38 install.yaml

