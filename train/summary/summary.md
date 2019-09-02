## kubernetes-总结

### 1: 滚动发布的占比,副本多的时候,希望尽快的发布完成
```
   查看 kubernetes 命令 kubectl explain deploy.spec.strategy.rollingUpdate
   关注属性: maxSurge,maxUnavailable
   
   举例: 当deployment 有5 个副本的时候,默认25%，从v1 -> v2
   那么同一时间点: 
   可用的最少为: 5 - (5 * 0.25 = 1.25 向下取整 = 1) = 4个
   扩容出来的容器最多为 5 + (5.0.25 = 1.25 向上取整 = 2) = 7个
   
   结论: 如果想快速发布完成，可以调整  maxSurge 的值，这样在同一时间点，有更多的项目在部署
   
```

### 2: Deployment 滚动发布的时候，旧的容器希望多留存一会，放置一些耗时的操作
```
 terminationGracePeriodSeconds, 优雅的关闭,默认为 30 秒
 but: 实际测试的时候，这个参数单独使用，没有用处，测试下来，可以这么用，如果要让旧容器多停留100秒，需要
  
     terminationGracePeriodSeconds: 100 

     lifecycle:
       preStop:
         exec:
           command: ['/bin/sh','-c',' sleep 100']
           
 配置这2个参数之后,就可以了           
```



#### 4: nf_conntrack_max的问题

```
kubectl edit  configmap kube-proxy  -n kube-system

修改conntrack.min从131072 修改为 262144
```

