## kubernetes-nginx

### PODS

+ #### 拷贝本目录的nginx_pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f nginx_pod.yaml
+ #### 查看pod状态
       kubectl get pods -o wide
          NAME                      READY     STATUS    RESTARTS   AGE       IP            NODE         NOMINATED NODE
          pod-demo                  1/1       Running   0          4m        10.244.0.66   app   <none>
       kubectl describe pods pod-demo   
+ #### 执行验证   
       curl 10.244.0.66    
          Hello MyApp | Version: v1 | <a href="hostname.html">Pod Name</a>   
          
+ #### 删除pod
       delete -f nginx_pod.yaml   

+ #### POD生命周期
       Pending,Running,Failed,Succeeded,Unknown
       初始化容器
       容器探测 -liveness,-readliness
       
+ #### 容器的重启策略
       Always, OnFailure, Never  
       terminationGracePeriodSeconds : 终止时间                           
       
附表:
args与command的关系
https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell


### Services
