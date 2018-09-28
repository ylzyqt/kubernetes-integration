## kubernetes-docs

+ #### 特性:
       自动装箱
       自我修复
       水平扩展
       服务发现和负载均衡
       自动发布和回滚
       秘钥和配置管理
       存储编排
       批量处理执行

+ #### 集群
       有中心节点架构的集群系统  (master/nodes[worker])  
           master可以有3台机器[高可用] (kubernetes cluster  -> api server)
                 |
                 |
                 |控制器管理器(监控控制器是否监控) ->冗余（所以需要master 3台节点）
                 |控制器(loop探测容器是否是健康)
                 |调度器(schedule)
                 |
                 !
           node[worker]其实就是各个运行容器的机器
                 |
                 | kubelet
                 | 容器引擎(docker)
                 |