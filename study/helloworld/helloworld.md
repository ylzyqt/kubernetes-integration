## kubernetes-hello world

+ #### 拷贝本目录的nginx-pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f nginx-pod.yaml
+ #### 查看pod状态
       kubectl get pods
           NAME        READY     STATUS    RESTARTS   AGE
           nginx-pod   1/1       Running   0          3h
       kubectl describe pods nginx-pod      