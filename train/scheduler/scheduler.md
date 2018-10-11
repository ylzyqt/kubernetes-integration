## kubernetes-scheduler

+ #### scheduler
       1. [预选] 
         （限制资源需求、下限、基本保障、限额）
       2. 优选策略
       3. 选定
       
       亲和性和反亲和性
       
       
+ #### [预选策略](https://github.com/kubernetes/kubernetes/blob/master/pkg/scheduler/algorithm/predicates/predicates.go)
       1.  checkNodeCondition
       2.  GeneralPredicates
             HostName: 机器名称 (kubectl explain pod.spec.hostname)
             PodFitsHostPorts: 能适配节点的端口 (kubectl explain pod.spec.containers.ports)
       3.  MatchNodeSelector
             标签选择器   (kubectl explain pod.spec.nodeSelector)  
       4.  PodFitsResources 
             资源限制   
       5.  PodToleratesNodeTaints 污点  (kubectl explain pod.spec.tolerations)
       6.  CheckServiceAffinity 亲和度 默认没有启动
       
       
+ #### [优选函数](https://github.com/kubernetes/kubernetes/tree/master/pkg/scheduler/algorithm/priorities)
       1.  LeastRequested 空闲比例
       2.  InterPodAffinity  亲和性      