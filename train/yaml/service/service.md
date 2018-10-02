## kubernetes-services

### SERVICES

+ #### 拷贝本目录的service.yaml 到自定义目录
       kubectl apply -f service.yaml
       
       通过: while true;do curl http://NodePort:30009/;sleep 1;done  来实现验证
       
       通过修改pod.yaml来apply的方式，验证滚动更新
       
       SessionAffinity 同一ip请求，打到同一pod上面去

+ #### 描述
       pod的变化，会请求到api-service,各个node节点的kube-proxy会watch api-service
       以完成信息的监听，并影响到ipvs
       工作模式 
               userspace (<=v1.1)  
           ->  iptables(<=v.10) 
           ->  ipvs(>=1.11)
       
       类型
           ClusterIp: 集群内部地址
           NodePort: 外部公开
           LoadBalancer: 负载均衡
           ExternalName: 外部
               
               
       关联关系  services- endpoint-pod   
       
       资源记录: SERVICE_NAME.NS_NAME.DOMAIN.LTD
                
                例如:  myservice.default.svc.cluster.local.     
           
           