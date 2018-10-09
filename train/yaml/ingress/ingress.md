## kubernetes-ingress

### [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

+ #### 通过git下载具体的nginx的案例
       git clone https://github.com/kubernetes/ingress-nginx.git
       
       进入deploy目录
       -- 创建namespace
          kubectl apply -f namespace.yaml
       -- 创建其余资源
          kubectl apply -f ./
       -- 查看镜像文件
          kubectl get pods -n ingress-nginx    
          
          
       或者: kubectl apply -f 
       https://github.com/kubernetes/ingress-nginx/blob/master/deploy/mandatory.yaml 
       可以直接部署     
       

+ #### 描述
       惯性思维的方式 user -> node(services) -> ingress(https会话卸载器) 
                                                                   -> pod1 
                                                                   -> pod2
                                                                   -> pod3
                                                                   
                                                                   
       当前的方式
       user -> ingress(https会话卸载器) controller 
                                  -> pod1
                                  -> pod2
                                  -> pod3       
                                  
+ #### 步骤
       1. 执行 deploy-demo.yaml
       2. 执行 kubectl apply -f service-nodeport.yaml  
       3. 执行 kubectl create -f ingress-myapp.yaml                                                                                               
                                                   
                                                   
           