## kubernetes-install-cluster

+  #### 环境准备
        Ubuntu 16.04 *3 作为master 
        Ubuntu 16.04 *n 作为node<此处不包含node的部分>

+  #### 安装ETCD
        背景: 因为已经有了安装k8s单master的经验，此处使用的时候，先看了kubeadm里面，
              安装的etcd的版本，此处于k8s单节点默认的保持一致
        1. 下载ETCD安装文件
        sudo wget https://github.com/coreos/etcd/releases/download/v3.2.24/etcd-v3.2.24-linux-amd64.tar.gz           
        
        2. 解压并拷贝
           tar -zxvf etcd-v3.2.24-linux-amd64.tar.gz \
           && mv etcd-v3.2.24-linux-amd64 /usr/local/ \
           && ln -s /usr/local/etcd-v3.2.24-linux-amd64/etcd /usr/sbin/etcd \
           && ln -s /usr/local/etcd-v3.2.24-linux-amd64/etcdctl /usr/sbin/etcdctl
           
           
        3. 创建配置文件
           创建目录:  sudo mkdir /var/lib/etcd/
           创建文件:  /opt/config/etcd.conf  内容如下
           ip要替换为自身的ip
           
           ETCD_DATA_DIR=/var/lib/etcd
           ETCD_NAME=k8s2
           ETCD_INITIAL_CLUSTER=k8s1=http://ip1:2380,k8s2=http://ip2:2380,k8s3=http://ip3:2380
           ETCD_INITIAL_CLUSTER_STATE=new
           ETCD_INITIAL_ADVERTISE_PEER_URLS=http://ip1:2380
           ETCD_ADVERTISE_CLIENT_URLS=http://ip1:2379
           ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379
           ETCD_LISTEN_PEER_URLS=http://0.0.0.0:2380
           GOMAXPROCS=$(nproc)
           
           
        4. 创建启动文件
    
           cat > /etc/systemd/system/etcd.service <<EOF
           [Unit]
           Description=Etcd Server
           Documentation=https://github.com/coreos/etcd
           After=network.target
           
           
           [Service]
           User=root
           Type=notify
           EnvironmentFile=-/opt/config/etcd.conf
           ExecStart=/usr/sbin/etcd
           Restart=on-failure
           RestartSec=10s
           LimitNOFILE=40000
           
           [Install]
           WantedBy=multi-user.target
           EOF
  
           
           使之生效
           sudo systemctl daemon-reload 
           sudo systemctl enable etcd
           sudo systemctl start etcd   
           
         5. 验证:
          sudo etcdctl cluster-health  
          
         6. 如果出现 request cluster ID mismatch (got bdd7c7c32bde1208 want 698851d67fea3c17) 
           那么删除  /var/lib/etcd/ 下的文件即可，因为刚开始，可能测试部署

+   #### 安装k8s

         1. 在 3台 master 机器上面, 参考 [单节点安装](http) 一直到完成Swap
         
         2. 在第一台上面执行 kubeadm init --config kubeadm-config.yaml --ignore-preflight-errors=Swap 即可完成第一台部署
         
           