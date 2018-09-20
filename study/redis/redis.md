## kubernetes-redis

+ #### 拷贝本目录的redis-pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f redis-pod.yaml
+ #### 查看pod状态
       kubectl get pods
           nginx-pod            1/1       Running   0          5h
           redis-master-rp5k6   1/1       Running   0          20m
       kubectl describe pods redis-master-rp5k6      