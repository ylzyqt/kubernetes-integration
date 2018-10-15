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
       
       
+ #### 高级调度设置
       1. affinity 亲和性
          podAffinity:   pod 亲和性
          nodeAffinity:  node 亲和性 pod_affinity.yaml 或者 pod_affinity_pre.yaml
          podAntiAffinity:  labels配置相同，但是 topologyKey选择hostname, 即可指定机器，然后进行
          
       2. tolerations 容忍   
          NoSchedule : 仅影响调度过程，对现存的pod不产生影响
          NoExecute: 即影响调度过程，也影响现存的pod对象
          preferNoSchedule: 最好不调度
           