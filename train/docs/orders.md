## kubernetes-orders

+ #### run:
       创建pod
       命令: kubectl run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool]
       案例: kubectl run nginx --image=nginx:1.14-alpine  --port=80 --replicas=1
            kubectl run client --image=busybox --replicas=1 -it 进入控制台终端
       
       
+ #### expose:
       创建service
       命令: kubectl expose (-f FILENAME | TYPE NAME) [--port=port] [--protocol=TCP|UDP] [--target-port=number-or-name]
           [--name=name] [--external-ip=external-ip-of-service] [--type=type] [options]
       案例: kubectl expose deploy nginx --name=nginx --port=80 --target-port=80 --protocol=TCP
             

+ #### get:

       kubectl get pods -o wide 查看带详细信息
       
       NAME                     READY     STATUS    RESTARTS   AGE       IP            NODE         NOMINATED NODE
       nginx-79976cbb47-tttq2   1/1       Running   0          5m        10.244.0.61   *****   <none>
       
       通过curl 10.244.0.61 访问，即可看到结果
       
       查看标签
       kubectl get pods --show-labels
       kubectl get pods -L env 查看env的结果值[查看对应资源的值]
       kubectl get pods -l env=test 标签过滤
           =,==,!=
           
       kubectl get pods -l "release in (2.0)" 按照IN    
           
       
       手动打标签:
       kubectl label pods pod-demo release=1.0
       kubectl label pods pod-demo release=2.0 --overwrite=true  修改标签
       
       
+ #### describe:
       kubectl describe services nginx  
       
+ #### delete:
       kubectl delete pods ***

+ #### edit
        kubectl edit services [service_name]     
        修改为NodePort即可外部访问 

+ #### scale
        扩容
        命令: kubectl scale [--resource-version=version] [--current-replicas=count] --replicas=COUNT (-f FILENAME | TYPE NAME)
        案例: kubectl scale --replicas=2 deploy nginx         
        
+ #### set
       改变镜像的版本
       命令: kubectl set image (-f FILENAME | TYPE NAME) CONTAINER_NAME_1=CONTAINER_IMAGE_1 ... CONTAINER_NAME_N=CONTAINER_IMAGE_N
       案例: kubectl set image deploy nginx nginx=nginx:1.14-alpine
             
             
+ #### rollout
       命令: 
       kubectl rollout status deploy nginx  查看更新进度
       kubectl rollout undo (TYPE NAME | TYPE/NAME) [flags] [options] 回滚
                    
               
                 
                       
