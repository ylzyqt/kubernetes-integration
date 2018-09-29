## kubernetes-docs

+ #### 资源
         工作负载型资源(workload): pod,replicaSet, Deploy,StatefulSet,DaemonSet,Job,cronJbo
         服务发现及均衡: services ,ingress
         配置与存储资源: volumn, CSI
         集群级的资源: namespace,node,role,clusterRole,roleBinding,clusterRoleBinding
         元数据型资源: HPA,pod template,limitRange   
         
+ #### 资源核心定义         
         apiServer仅接受json格式的资源定义, yaml格式提供配置清单，apiServer可自动将其转为json格式，然后再提交执行
         
         apiVersion: kubectl api-versions   (beta公测)
         
         kind : 资源类别          
                     
         metadata: 元数据
             name: 名称
             namespace: 命名空间
             labels: 标签
             annotations: 资源注解
             
         spec: 期望的状态
         
         status: 当前状态     current state 本字段由kubernetes集群维护
         
         对于无法了解具体的定义，可以
            kubectl explain pod 查看pod定义
            kubectl explain pod.metadata: 查看pod.metadata字段定义
         
                 
                