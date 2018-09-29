## kubernetes-nginx

+ #### 拷贝本目录的nginx_pod.yaml 到自定义目录

+ #### 执行命令:
       kubectl create -f nginx-pod.yaml
+ #### 查看pod状态
       kubectl get pods -o wide
          NAME                      READY     STATUS    RESTARTS   AGE       IP            NODE         NOMINATED NODE
          pod-demo                  1/1       Running   0          4m        10.244.0.66   app   <none>
       kubectl describe pods pod-demo   
+ #### 执行验证   
       curl 10.244.0.66    
          Hello MyApp | Version: v1 | <a href="hostname.html">Pod Name</a>   