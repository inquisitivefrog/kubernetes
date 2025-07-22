
sre@k8s-node-02:~$ kubectl get namespaces
NAME                   STATUS   AGE
argocd                 Active   113m
default                Active   35d
demo                   Active   27d
kube-flannel           Active   35d
kube-node-lease        Active   35d
kube-public            Active   35d
kube-system            Active   35d
kubernetes-dashboard   Active   28d
projectcontour         Active   17d
space                  Active   5d21h
test                   Active   6d2h

sre@k8s-node-02:~$ sudo iptables --list
# Warning: iptables-legacy tables present, use iptables-legacy to see them
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-NODEPORTS  all  --  anywhere             anywhere             /* kubernetes health check service ports */
KUBE-EXTERNAL-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes externally-visible service portals */
KUBE-FIREWALL  all  --  anywhere             anywhere            
DROP       tcp  --  anywhere             localhost            tcp dpt:6784 ADDRTYPE match src-type !LOCAL ! ctstate RELATED,ESTABLISHED /* Block non-local access to Weave Net control port */
WEAVE-NPC-EGRESS  all  --  anywhere             anywhere            

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
WEAVE-NPC-EGRESS  all  --  anywhere             anywhere             /* NOTE: this must go before '-j KUBE-FORWARD' */
WEAVE-NPC  all  --  anywhere             anywhere             /* NOTE: this must go before '-j KUBE-FORWARD' */
NFLOG      all  --  anywhere             anywhere             state NEW nflog-group 86
DROP       all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-FORWARD  all  --  anywhere             anywhere             /* kubernetes forwarding rules */
KUBE-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes service portals */
KUBE-EXTERNAL-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes externally-visible service portals */
DOCKER-USER  all  --  anywhere             anywhere            
DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
FLANNEL-FWD  all  --  anywhere             anywhere             /* flanneld forward */

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
KUBE-PROXY-FIREWALL  all  --  anywhere             anywhere             ctstate NEW /* kubernetes load balancer firewall */
KUBE-SERVICES  all  --  anywhere             anywhere             ctstate NEW /* kubernetes service portals */
KUBE-FIREWALL  all  --  anywhere             anywhere            

Chain DOCKER (1 references)
target     prot opt source               destination         

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination         
DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-ISOLATION-STAGE-2 (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-USER (1 references)
target     prot opt source               destination         
RETURN     all  --  anywhere             anywhere            

Chain FLANNEL-FWD (1 references)
target     prot opt source               destination         
ACCEPT     all  --  10.244.0.0/16        anywhere             /* flanneld forward */
ACCEPT     all  --  anywhere             10.244.0.0/16        /* flanneld forward */

Chain KUBE-EXTERNAL-SERVICES (2 references)
target     prot opt source               destination         

Chain KUBE-FIREWALL (2 references)
target     prot opt source               destination         
DROP       all  -- !localhost/8          localhost/8          /* block incoming localnet connections */ ! ctstate RELATED,ESTABLISHED,DNAT

Chain KUBE-FORWARD (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere             ctstate INVALID
ACCEPT     all  --  anywhere             anywhere             /* kubernetes forwarding rules */ mark match 0x4000/0x4000
ACCEPT     all  --  anywhere             anywhere             /* kubernetes forwarding conntrack rule */ ctstate RELATED,ESTABLISHED

Chain KUBE-KUBELET-CANARY (0 references)
target     prot opt source               destination         

Chain KUBE-NODEPORTS (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere             /* projectcontour/envoy:http health check node port */ tcp dpt:30931
ACCEPT     tcp  --  anywhere             anywhere             /* projectcontour/envoy:https health check node port */ tcp dpt:30931

Chain KUBE-PROXY-CANARY (0 references)
target     prot opt source               destination         

Chain KUBE-PROXY-FIREWALL (3 references)
target     prot opt source               destination         

Chain KUBE-SERVICES (2 references)
target     prot opt source               destination         
REJECT     tcp  --  anywhere             10.96.7.189          /* argocd/argocd-redis-ha-announce-2:tcp-server has no endpoints */ tcp dpt:redis reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             10.96.7.189          /* argocd/argocd-redis-ha-announce-2:tcp-sentinel has no endpoints */ tcp dpt:26379 reject-with icmp-port-unreachable

Chain WEAVE-CANARY (0 references)
target     prot opt source               destination         

Chain WEAVE-NPC (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             base-address.mcast.net/4 
ACCEPT     all  --  anywhere             anywhere             PHYSDEV match --physdev-out vethwe-bridge --physdev-is-bridged
WEAVE-NPC-DEFAULT  all  --  anywhere             anywhere             state NEW
WEAVE-NPC-INGRESS  all  --  anywhere             anywhere             state NEW

Chain WEAVE-NPC-DEFAULT (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             match-set weave-qUZ:jOBPP2@d?lP%uT}.kL]I7 dst /* DefaultAllow ingress isolation for namespace: argocd */
ACCEPT     all  --  anywhere             anywhere             match-set weave-;rGqyMIl1HN^cfDki~Z$3]6!N dst /* DefaultAllow ingress isolation for namespace: default */
ACCEPT     all  --  anywhere             anywhere             match-set weave-qCsh3[J9tiJ{aPB:BH@5I=k;+ dst /* DefaultAllow ingress isolation for namespace: demo */
ACCEPT     all  --  anywhere             anywhere             match-set weave-L{!8F5R)t=i?[h?gwrGulfSc7 dst /* DefaultAllow ingress isolation for namespace: kube-flannel */
ACCEPT     all  --  anywhere             anywhere             match-set weave-]B*(W?)t*z5O17G044[gUo#$l dst /* DefaultAllow ingress isolation for namespace: kube-node-lease */
ACCEPT     all  --  anywhere             anywhere             match-set weave-Rzff}h:=]JaaJl/G;(XJpGjZ[ dst /* DefaultAllow ingress isolation for namespace: kube-public */
ACCEPT     all  --  anywhere             anywhere             match-set weave-P.B|!ZhkAr5q=XZ?3}tMBA+0 dst /* DefaultAllow ingress isolation for namespace: kube-system */
ACCEPT     all  --  anywhere             anywhere             match-set weave-Z#vOGl@kZ|H8Nsg0sY:M0^V[c dst /* DefaultAllow ingress isolation for namespace: kubernetes-dashboard */
ACCEPT     all  --  anywhere             anywhere             match-set weave-Yg8)IyK!^/@Az:Fi{xA8iq5q$ dst /* DefaultAllow ingress isolation for namespace: projectcontour */
ACCEPT     all  --  anywhere             anywhere             match-set weave-:H9A.d2%ADX?msohO~i+PyBSJ dst /* DefaultAllow ingress isolation for namespace: space */
ACCEPT     all  --  anywhere             anywhere             match-set weave-1pHqjVl9[Q_;b@9DpG:~fM%_Y dst /* DefaultAllow ingress isolation for namespace: test */

Chain WEAVE-NPC-EGRESS (2 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
RETURN     all  --  anywhere             anywhere             PHYSDEV match --physdev-in vethwe-bridge --physdev-is-bridged
RETURN     all  --  anywhere             anywhere             ADDRTYPE match dst-type LOCAL
RETURN     all  --  anywhere             base-address.mcast.net/4 
WEAVE-NPC-EGRESS-DEFAULT  all  --  anywhere             anywhere             state NEW
WEAVE-NPC-EGRESS-CUSTOM  all  --  anywhere             anywhere             state NEW mark match ! 0x40000/0x40000
NFLOG      all  --  anywhere             anywhere             state NEW mark match ! 0x40000/0x40000 nflog-group 86
DROP       all  --  anywhere             anywhere             mark match ! 0x40000/0x40000

Chain WEAVE-NPC-EGRESS-ACCEPT (15 references)
target     prot opt source               destination         
MARK       all  --  anywhere             anywhere             MARK or 0x40000

Chain WEAVE-NPC-EGRESS-CUSTOM (1 references)
target     prot opt source               destination         
WEAVE-NPC-EGRESS-ACCEPT  udp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src udp dpt:domain /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> anywhere (egress) */
RETURN     udp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src udp dpt:domain /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> anywhere (egress) */
WEAVE-NPC-EGRESS-ACCEPT  tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src tcp dpt:domain /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> anywhere (egress) */
RETURN     tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src tcp dpt:domain /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> anywhere (egress) */
WEAVE-NPC-EGRESS-ACCEPT  tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (egress) */
RETURN     tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (egress) */
WEAVE-NPC-EGRESS-ACCEPT  tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (egress) */
RETURN     tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (egress) */

Chain WEAVE-NPC-EGRESS-DEFAULT (1 references)
target     prot opt source               destination         
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-S+.tz}[H+7%4Z$K%$CcP]4s/R src /* DefaultAllow egress isolation for namespace: argocd */
RETURN     all  --  anywhere             anywhere             match-set weave-S+.tz}[H+7%4Z$K%$CcP]4s/R src /* DefaultAllow egress isolation for namespace: argocd */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-s_+ChJId4Uy_$}G;WdH|~TK)I src /* DefaultAllow egress isolation for namespace: default */
RETURN     all  --  anywhere             anywhere             match-set weave-s_+ChJId4Uy_$}G;WdH|~TK)I src /* DefaultAllow egress isolation for namespace: default */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-O4;Y%T*%/sz0HyNEdekU9{.Ki src /* DefaultAllow egress isolation for namespace: demo */
RETURN     all  --  anywhere             anywhere             match-set weave-O4;Y%T*%/sz0HyNEdekU9{.Ki src /* DefaultAllow egress isolation for namespace: demo */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-bsPpCUwhIinUU5YTjLDp)le_r src /* DefaultAllow egress isolation for namespace: kube-flannel */
RETURN     all  --  anywhere             anywhere             match-set weave-bsPpCUwhIinUU5YTjLDp)le_r src /* DefaultAllow egress isolation for namespace: kube-flannel */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-sui%__gZ}{kX~oZgI_Ttqp=Dp src /* DefaultAllow egress isolation for namespace: kube-node-lease */
RETURN     all  --  anywhere             anywhere             match-set weave-sui%__gZ}{kX~oZgI_Ttqp=Dp src /* DefaultAllow egress isolation for namespace: kube-node-lease */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-41s)5vQ^o/xWGz6a20N:~?#|E src /* DefaultAllow egress isolation for namespace: kube-public */
RETURN     all  --  anywhere             anywhere             match-set weave-41s)5vQ^o/xWGz6a20N:~?#|E src /* DefaultAllow egress isolation for namespace: kube-public */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-E1ney4o[ojNrLk.6rOHi;7MPE src /* DefaultAllow egress isolation for namespace: kube-system */
RETURN     all  --  anywhere             anywhere             match-set weave-E1ney4o[ojNrLk.6rOHi;7MPE src /* DefaultAllow egress isolation for namespace: kube-system */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-R*@FbGx26A1FK[B%n)o#!Ptyx src /* DefaultAllow egress isolation for namespace: kubernetes-dashboard */
RETURN     all  --  anywhere             anywhere             match-set weave-R*@FbGx26A1FK[B%n)o#!Ptyx src /* DefaultAllow egress isolation for namespace: kubernetes-dashboard */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-q.1B!_tAEyy+)S]$vHZq:4Fol src /* DefaultAllow egress isolation for namespace: projectcontour */
RETURN     all  --  anywhere             anywhere             match-set weave-q.1B!_tAEyy+)S]$vHZq:4Fol src /* DefaultAllow egress isolation for namespace: projectcontour */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-f4KM_WEt4sbjCSZx2Ur.SnNVq src /* DefaultAllow egress isolation for namespace: space */
RETURN     all  --  anywhere             anywhere             match-set weave-f4KM_WEt4sbjCSZx2Ur.SnNVq src /* DefaultAllow egress isolation for namespace: space */
WEAVE-NPC-EGRESS-ACCEPT  all  --  anywhere             anywhere             match-set weave-eh0H0pOqmhkDi$o/fQ_%Z%Qo7 src /* DefaultAllow egress isolation for namespace: test */
RETURN     all  --  anywhere             anywhere             match-set weave-eh0H0pOqmhkDi$o/fQ_%Z%Qo7 src /* DefaultAllow egress isolation for namespace: test */

Chain WEAVE-NPC-INGRESS (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-aZNRNTYaF~jEEv+O|bzrSY^ld dst tcp dpt:8082 /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-application-controller (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-]$xfvs!0ze8=l0H*U0?%ZqT/+ dst tcp dpt:bbs /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-applicationset-controller (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-]$xfvs!0ze8=l0H*U0?%ZqT/+ dst tcp dpt:http-alt /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-applicationset-controller (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 src match-set weave-cmnbPxG8};_Px$zgr[2ntKMOX dst tcp dpt:freeciv /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-dex-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 src match-set weave-cmnbPxG8};_Px$zgr[2ntKMOX dst tcp dpt:5557 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-dex-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-cmnbPxG8};_Px$zgr[2ntKMOX dst tcp dpt:5558 /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-dex-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-SF:}%~QI@8/2YsyF(X5c0M/$S dst tcp dpt:9001 /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-notifications-controller (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-aZNRNTYaF~jEEv+O|bzrSY^ld src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-application-controller -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-aZNRNTYaF~jEEv+O|bzrSY^ld src match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-application-controller -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-lC@f!M;nXu0jI8g$0OG#bir?g src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha-haproxy -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:redis /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl src match-set weave-_bEAv)[(ZDm401N*WL:q^E/zl dst tcp dpt:26379 /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-redis-ha (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 src match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u dst tcp dpt:tproxy /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-aZNRNTYaF~jEEv+O|bzrSY^ld src match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u dst tcp dpt:tproxy /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-application-controller -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-SF:}%~QI@8/2YsyF(X5c0M/$S src match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u dst tcp dpt:tproxy /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-notifications-controller -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-]$xfvs!0ze8=l0H*U0?%ZqT/+ src match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u dst tcp dpt:tproxy /* pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-applicationset-controller -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server (ingress) */
ACCEPT     tcp  --  anywhere             anywhere             match-set weave-!KbcPP7#:Z;q|kV;:5)S@i1Yb src match-set weave-_A[)}ESt3rX@OEFW5WZpTW%1u dst tcp dpt:8084 /* namespaces: selector:  -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-repo-server (ingress) */
ACCEPT     all  --  anywhere             anywhere             match-set weave-#S8fBcMHw*#tP3[$:PaLUu5M0 dst /* anywhere -> pods: namespace: argocd, selector: app.kubernetes.io/name=argocd-server (ingress) */
sre@k8s-node-02:~$ sudo iptables --list | grep FORWARD
# Warning: iptables-legacy tables present, use iptables-legacy to see them
Chain FORWARD (policy ACCEPT)
WEAVE-NPC-EGRESS  all  --  anywhere             anywhere             /* NOTE: this must go before '-j KUBE-FORWARD' */
WEAVE-NPC  all  --  anywhere             anywhere             /* NOTE: this must go before '-j KUBE-FORWARD' */
KUBE-FORWARD  all  --  anywhere             anywhere             /* kubernetes forwarding rules */
Chain KUBE-FORWARD (1 references)

