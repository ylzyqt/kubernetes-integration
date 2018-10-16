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
        

+ #### kubernetes join
        kubeadm join*******  就是上面安装master成功后的输出  
     