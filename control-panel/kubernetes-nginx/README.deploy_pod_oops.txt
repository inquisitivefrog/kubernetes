
Events:
  Type     Reason       Age                From               Message
  ----     ------       ----               ----               -------
  Normal   Scheduled    25m                default-scheduler  Successfully assigned default/nginx to k8s-node-01
  Normal   Pulled       25m                kubelet            Container image "nginx:1.26.2" already present on machine
  Normal   Created      25m                kubelet            Created container main
  Normal   Started      25m                kubelet            Started container main
  Warning  FailedMount  42s (x5 over 50s)  kubelet            MountVolume.SetUp failed for volume "config-volume" : configmap "nginx-config" not found
  Warning  FailedMount  34s (x6 over 50s)  kubelet            MountVolume.SetUp failed for volume "html-volume" : configmap "nginx-html" not found

