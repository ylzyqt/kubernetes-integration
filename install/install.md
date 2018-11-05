## kubernetes-install

+  #### 环境准备
        Ubuntu 16.04 [本文中使用的是阿里云经典网络机器]

+  #### 切换root账号
        sudo su
        
+  #### 安装docker(docker的版本只是warning,可以使用自用版本)
        新版本的k8s支持的docker版本列表，已经比较高了,如果已经有安装docker，确保第5步
        1. 卸载已有docker :  sudo apt-get remove docker docker-engine docker.io
        2. apt-get update
        3. apt-cache policy docker-engine 查找目前可安装的版本，注意kubernetes v.1.11.3支持<=17.03版本
           本文安装17.03.0-ce   
        4. 安装docker    sudo apt-get install -y docker-engine=17.03.0~ce-0~ubuntu-xenial              
        5. 设置自启动  sudo systemctl enable docker 
        
+  #### pull镜像 (有此步骤、可以不用科学上网)
        1. kubeadm config images list
        2. 将当前目录的images、pull_images.sh文件 拷贝到机器自定义目录，然后执行 sh pull_images.sh即可pull镜像          

            
+  #### 安装kubernetes
        1. apt-get update && apt-get install -y apt-transport-https
        2. curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
        3. cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
           deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
           EOF
        4. apt-get update
        5. apt-cache policy kubectl 查看版本
        5. apt-get install -y kubelet=1.12.1-00 kubeadm=1.12.1-00 kubectl=1.12.1-00
        6. 设置自启动  sudo systemctl enable kubelet        
                
+  #### swap设置
        /etc/systemd/system/kubelet.service.d
        
        Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --fail-swap-on=false"
        systemctl daemon-reload
        systemctl restart kubelet
        

+ #### kubernetes init
        1.  kubeadm init --kubernetes-version=1.12.1 --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=Swap
             
             --apiserver-advertise-address=内网ip地址 可以忽略
             当出问题之后  kubeadm reset 可以重置kubeadm然后再进行kube init...
        
        2.   成功之后的日志输出，一定要记得执行（普通账号）
                   mkdir -p $HOME/.kube
                   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
                   sudo chown $(id -u):$(id -g) $HOME/.kube/config
                   
        3.   成功之后的日志输出，kubeadm join*******  请自行保存，这个是node节点用来joinmaster用的 
        
        4.   kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
        
        5.   kubectl taint nodes --all node-role.kubernetes.io/master- 如果是单节点,否则可以忽略
        
        6.   验证安装成功 : kubectl get nodes
        
        注意: 10.244.0.0/16 的flannel网络最多支持256个节点
                master: 10.244.0.0/24
                node1:  10.244.1.0/24
                node2:  10.244.2.0/24
                ...
                node255: 10.244.255.0/24
             所以生产环境，机器比较多的，可以
             10.244.0.0/12 这样，可以最多4096台机器的集群    
             
        7. node节点，完全删除相关的k8s信息
kubeadm reset
systemctl stop kubelet
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /run/flannel
rm -rf /etc/cni/
ifconfig cni0 down
ifconfig flannel.1 down   
ip link delete cni0
ip link delete flannel.1
           
           systemctl start docker
  


+ #### [dashboard](https://github.com/kubernetes/dashboard)
        开启外网访问
        kubectl patch svc kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system            
        
        kubectl create serviceaccount dashboard-admin -n kube-system
        kubectl create clusterrolebinding dashboard-admin --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard-admin
        kubectl get secret -n kube-system
        kubectl describe secret dashboard-admin-token-8lq9n -n kube-system

            
