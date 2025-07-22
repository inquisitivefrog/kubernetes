
HPA: horizontal pod autoscaler
VPA: vertical pod autoscaler

horizontal scaling: with increased demand, additional pods are deployed

vertical scaling: with increased demand, additional resources are granted
                  to existing pod configurations but pods must be restarted

scaling triggers: usually CPU utilization or MEM usage

range: a minimum and maximum range are specified so that traffic spikes and
       lulls can be responded to in both directions

resources: only Deployment or StatefulSet


