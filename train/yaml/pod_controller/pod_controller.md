## kubernetes-pod-controller

### POD-Controller

#### ReplicaSet(新一代的ReplicationController)
     标签选择器
     用户期望副本数
     pod资源模版
     kubectl explain rs 查看语法
     kubectl create -f replicaSet.yaml
     kubectl get replicaSet 查看
     
#### Deployment(通过控制ReplicaSet来控制Pod)
     管理无状态控制器
     pod与副本数量的关系
     见deploy.yaml
     kubectl apply -f deploy.yaml  可以多次执行
     
     注意字段:
     maxSurge 
     maxUnavailabel
     
#### DaemonSet:
     管理无状态控制器
     确保集群中的每一个节点都只有一个特定的pod副本 
     集群有多少台，就有多少个副本
     
#### Job

#### CronJob
     
#### StatefulSet
     独有控制器         
   

