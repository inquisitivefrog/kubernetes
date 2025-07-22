
tim@Tims-MBP configmaps % kubectl get configmap
NAME               DATA   AGE
kube-root-ca.crt   1      20h

tim@Tims-MBP configmaps % vi my-config.txt
tim@Tims-MBP configmaps % cat my-config.txt 
parameter1 = value1
parameter2 = value2

tim@Tims-MBP configmaps % kubectl create configmap my-config --from-file=my-config.txt --from-literal=extra-param=extra-value --from-literal=another-param=another-value
configmap/my-config created

tim@Tims-MBP configmaps % kubectl get configmaps my-config -o yaml
apiVersion: v1
data:
  another-param: another-value
  extra-param: extra-value
  my-config.txt: |
    parameter1 = value1
    parameter2 = value2
kind: ConfigMap
metadata:
  creationTimestamp: "2024-11-01T17:51:06Z"
  name: my-config
  namespace: default
  resourceVersion: "53780"
  uid: 0f201361-a64d-4ca5-a74c-b199a8000aee

Key Takeaways
-------------
1. key:value pairs can be injected by reading from a file
   but they are then added to the data section of YAML
2. key:value pairs can be added at the command line
   but they are then also added to the data section of YAML
3. a config file can be declared this way but it is
   overwriting any existing config file so is that a great
   idea or not?
 
