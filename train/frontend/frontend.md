## kubernetes-frontend

+ #### 拷贝本目录的frontend-pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f frontend-pod.yaml
+ #### 查看pod状态
       kubectl get pods
           NAME                 READY     STATUS    RESTARTS   AGE
           frontend-95xhk       1/1       Running   0          1m
           frontend-mnzhw       1/1       Running   0          1m
           frontend-wzxgj       1/1       Running   0          1m
           nginx-pod            1/1       Running   0          6h
           redis-master-rp5k6   1/1       Running   0          50m       
+ #### 执行命令
       kubectl create -f frontend-service.yaml

+ #### 查看service状态
       kubectl get services
           NAME           TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
           frontend       NodePort    10.108.232.136   <none>        80:30001/TCP   6s
           kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP        1d
           redis-master   ClusterIP   10.103.102.146   <none>        6379/TCP       25m               