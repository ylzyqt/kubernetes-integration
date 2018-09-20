## kubernetes-install

+  #### 切换root账号
        sudo su
+  #### 禁用swap
        swapoff -a 永久禁用参考: /etc/fstab
+  #### 安装docker
        1. 卸载已有docker :  sudo apt-get remove docker docker-engine docker.io
        2. apt-get update
        3. apt-cache policy docker-engine 查找目前可安装的版本，注意kubernetes v.1.11.3支持<=17.03版本，本文推荐安装17.03.0-ce               
+  #### pull镜像 (有此步骤、可以不用科学上网)
        1. 将当前目录的images、pull_images.sh文件 拷贝到机器自定义目录，然后执行 sh pull_images.sh即可pull镜像    
+  #### 安装kubernetes
        1. apt-get update && apt-get install -y apt-transport-https
        2. curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
        3. cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
           deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
           EOF
        4. apt-get update
        5. apt-get install -y kubelet kubeadm kubectl
+ #### kubernetes init [此处master需要]
        kubeadm init --kubernetes-version=1.11.3 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=内网ip地址 
        常见报错:
        1. 需要带kubernates-version,否则: unable to get URL "https://dl.k8s.io/release/stable-1.11.txt": Get https://storage.googleapis.com/kubernetes-release/release/stable-1.11.txt: dial tcp 172.217.160.112:443: i/o timeout
        2. 注意版本号，1.11.3与images中的版本，需要一致，否则会出现:     [ERROR ImagePull]: failed to pull image [k8s.gcr.io/pause:3.1]: exit status 1 类似的错误              
        3. 成功之后的日志输出，一定要记得执行（普通账号）
           mkdir -p $HOME/.kube
           sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
           sudo chown $(id -u):$(id -g) $HOME/.kube/config
        4. 成功之后的日志输出，kubeadm join*******  请自行保存，这个是node节点用来joinmaster用的 
        5. kubectl taint nodes --all node-role.kubernetes.io/master- 如果是单节点
        6. 验证安装成功 : kubectl get nodes
        7. 当出问题之后  kubeadm reset 可以重置kubeadm然后再进行kube init...
+ #### kubernetes join [此处是slave需要]
        kubeadm join*******  就是上面安装master成功后的输出          
