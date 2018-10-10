## kubernetes-auth

+ #### 列表
      认证
      授权检查
      准入控制
      
      客户端 --> api server
            user: username , uid
            group: 
            extra: 额外信息
            API
            Request path (http://localhost:6443/apis/apps/v1/namespaces/default/myapp-deploy)
               kubectl proxy --port=8080
               curl http://localhost:8080/api/v1/namespaces
               curl http://localhost:8080/apis/apps/v1/namespaces/kube-system/deployments
            http request verb:
               get ，head, post , put ,patch, delete  
      serviceAccount
            kubectl create serviceaccount mysa -o yaml --dry-run 查询输出的格式  
      kubectl apply -f auth_pod.yaml 使用自定义sa
      kubectl config view 查看kubectl配置


+ #### RBAC rule-based-access-control 基于角色  
      1. users(用户)
      
      2. roles(角色) permissions(许可) 
        1. operations
        2. objects
        
      3. rolebinding
        1. useraccount or serviceaccount
        2. role
        
      4. clusterrole,clusterrolebinding  
      
      5. 创建role:
      
      kubectl create role pods-reader --verb=get,list,watch --resource=pods --dry-run -o yaml 
      由此得出文件：
      kubectl apply -f role_demo.yaml
      
      6. 创建rolebinding
      kubectl create rolebinding mysa-read-pods  --role=pods-reader --serviceaccount=default:mysa  -o yaml --dry-run 
      kubectl apply -f role_binding_demo.yaml
      
      
          
        
      
                   
      
