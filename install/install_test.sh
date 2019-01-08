#!/bin/bash
systemctl enable docker

touch images
echo "k8s.gcr.io/kube-apiserver:v1.12.1=registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver-amd64:v1.12.1" > images
echo "k8s.gcr.io/pause:3.1=registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:3.1" >> images
echo "k8s.gcr.io/etcd:3.2.24=registry.cn-hangzhou.aliyuncs.com/google_containers/etcd-amd64:3.2.24" >> images
echo "k8s.gcr.io/coredns:1.2.2=registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:1.2.2" >> images
echo "k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.0=registry.cn-hangzhou.aliyuncs.com/google_containers/kubernetes-dashboard-amd64:v1.10.0" >> images
echo "gcr.io/kubernetes-helm/tiller:v2.11.0=registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.11.0" >> images
echo "k8s.gcr.io/kube-controller-manager:v1.12.1=registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager-amd64:v1.12.1" >> images
echo "k8s.gcr.io/kube-scheduler:v1.12.1=registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler-amd64:v1.12.1" >> images
echo "k8s.gcr.io/kube-proxy:v1.12.1=registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy-amd64:v1.12.1" >> images

touch pull.sh
echo "#/bin/bash" > pull.sh
echo "file=\"images\"" >> pull.sh
echo "if [ -f \"\$file\" ]" >> pull.sh
echo " then" >> pull.sh
echo "   echo \"\$file found.\"" >> pull.sh
echo "  while IFS='=' read -r key value" >> pull.sh
echo "  do" >> pull.sh
echo "   docker pull \${value} ">> pull.sh
echo "   docker tag \${value} \${key} " >> pull.sh
echo "   docker rmi \${value}" >> pull.sh
echo "  done < \"\$file\" " >> pull.sh
echo "  else" >> pull.sh
echo "  echo \"\$file not found.\"" >> pull.sh
echo " fi" >> pull.sh

sh pull.sh
echo "pull images success "
apt-get update && apt-get install -y apt-transport-https
echo "install apt-transport-https success"

curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
echo "install gpg success"

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

echo "install kubelet.list success "


apt-get update

apt-get install -y kubelet=1.12.1-00 kubeadm=1.12.1-00 kubectl=1.12.1-00

systemctl enable kubelet

sed -i 's/config.yaml/config.yaml --fail-swap-on=false/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
echo "change kubeadm config success"

systemctl daemon-reload
echo "daemon -reload success"
systemctl restart kubelet
echo "restart kubelet success"
echo "######################################################################################"
