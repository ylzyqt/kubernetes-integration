## kubernetes-storage

+ #### 存储卷
    kubernetes 适用的是无状态的服务

+ #### 类型
    emptyDir 临时目录/缓存 
    hostPath 主机路径   
    
+ #### hostPath
    参见 storage.yaml 中的定义即可
    
+ #### configmap
    kubectl apply -f configmap.yaml   
    kubectl apply -f configmap_pod.yaml
    kubectl exec -it storage -- /bin/sh
    printenv    系统启动后不会变化  
    
    configmap volumes
    kubectl apply -f config_volumes_pod.yaml  
      