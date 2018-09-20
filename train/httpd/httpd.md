## kubernetes-httpd

+ #### 拷贝本目录的httpd-pod.yaml,httpd-service.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f httpd-pod.yaml
    
+ #### 执行命令
       kubectl create -f httpd-service.yaml

+ #### 查看service状态
       kubectl get services
           NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
           frontend       NodePort    10.108.232.136   <none>        80:30001/TCP     1h
           httpd          NodePort    10.111.66.238    <none>        8088:30002/TCP   7m
           kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP          1d
           monitor        NodePort    10.97.161.168    <none>        80:32307/TCP     51m
           redis-master   ClusterIP   10.103.102.146   <none>        6379/TCP         1h
       kubectl describe service httpd       
           Name:                     httpd
           Namespace:                default
           Labels:                   k8s-app=httpd
           Annotations:              <none>
           Selector:                 k8s-app=httpd
           Type:                     NodePort
           IP:                       10.111.66.238
           Port:                     <unset>  8088/TCP
           TargetPort:               80/TCP
           NodePort:                 <unset>  30002/TCP
           Endpoints:                10.244.0.49:80
           Session Affinity:         None
           External Traffic Policy:  Cluster
           Events:                   <none>
       访问方式如下:
       curl http://10.244.0.49:80     
       curl http://10.111.66.238:8088   
       curl http://node-host:30002