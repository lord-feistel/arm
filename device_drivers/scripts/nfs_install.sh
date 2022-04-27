apt-get update
apt-get upgrade
apt-get install nfs-kernel-server -y

chown -R pi:pi /mnt/nfsshare
find /mnt/nfsshare/ -type d -exec chmod 755 {} \;
find /mnt/nfsshare/ -type f -exec chmod 644 {} \;

echo "/mnt/nfsshare *(rw,all_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000)" >>  /etc/exports

sudo exportfs -ra

# to acess use :
# sudo mount -t nfs -o rw 192.168.0.20:/mnt/nfsshare /home/neo/repo/drivers/
