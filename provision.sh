echo
echo "*********************************************************"
echo "Approvisionnement de la VM"
echo "*********************************************************"
echo

echo "installation de docker"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce
sudo systemctl start docker

echo "configuration du proxy pour docker"
mkdir -p /etc/systemd/system/docker.service.d
echo touch /etc/systemd/system/docker.service.d/http-proxy.conf
cat <<EOT >> /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://10.151.27.88:3128/" "HTTPS_PROXY=http://10.151.27.88:3128/"
EOT
sudo systemctl daemon-reload
sudo systemctl restart docker
systemctl show --property=Environment docker
sudo docker run hello-world
echo "fin configuration du proxy pour docker"


