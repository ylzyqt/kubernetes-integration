## kubernetes-redis

+ #### 拷贝本目录的redis-pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f redis-pod.yaml
+ #### 查看pod状态
       kubectl get pods
           nginx-pod            1/1       Running   0          5h
           redis-master-rp5k6   1/1       Running   0          20m
       kubectl describe pods redis-master-rp5k6
       
+ #### 执行命令
       kubectl create -f redis-service.yaml

+ #### 查看service状态
       kubectl get services
           NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
           kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP    1d
           redis-master   ClusterIP   10.103.102.146   <none>        6379/TCP   9m                