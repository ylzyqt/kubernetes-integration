## kubernetes-总结

### 1: 滚动发布的占比,项目多的时候,希望尽快的发布完成
```
   查看 kubernetes 命令 kubectl explain deploy.spec.strategy.rollingUpdate
   关注属性: maxSurge,maxUnavailable
   
   举例: 当deployment 有5 个副本的时候,默认25%，从v1 -> v2
   那么同一时间点: 
     可用的最少为: 5 - (5 * 0.25 = 1.25 向下取整 = 1) = 4个
     扩容出来的容器最多为 5 + (5.0.25 = 1.25 向上取整 = 2) = 7个 
   
```