#!/bin/sh

echo "#################################################################################################"
echo "#                                                             __                                #"
echo "#                    ______ __  __  __  _____          ___   / /_____  _____                    #"
echo "#                   / ____// / / / / / / ___/   ____  / __\`\/ __/ __ \/ ___/                    #"
echo "#                  / /___ / /_/ /_/ / (__  )   /___/ / /_/ / /_/ /_/ (__  )                     #"
echo "#                  \____/ \___/\___/ /____/          \__,_/\__/\____/____/                      #"
echo "#                                                                                               #"
echo "#-----------------------------------------------------------------------------------------------#"
echo "#           For any additional informations, feel free to contact yassinemaachi5@gmail.com      #"
echo "#################################################################################################"

#########installing/updating otc-tools and OpenstackClient in case of it's not installed/updated###########
echo "#################################################################################################"
echo "#####installing/updating otc-tools and OpenstackClient in case of it's not installed/updated#####"
echo "#################################################################################################"
sudo yum install -y otc-tools
sudo yum  install -y  python-openstackclient
#########################################Network###########################################################
echo "#################################################################################################"
echo "############################## Updating the PROD-NETWORK stack ##################################"
echo "#################################################################################################"
time openstack stack update -t production-network-0.2.yaml -e production-environement-0.2.yaml PROD-NETWORK --wait
#########################################Storage###########################################################
echo "#################################################################################################"
echo "############################## Updating the PROD-STORAGE stack ##################################"
echo "#################################################################################################"
time openstack stack update -t production-storage-0.2.yaml -e production-environement-0.2.yaml PROD-STORAGE --wait
#########################################Servers###########################################################
echo "#################################################################################################"
echo "############################## Updating the PROD-SERVERS stack ##################################"
echo "#################################################################################################"
time openstack stack update -t production-servers-0.2.yaml -e production-environement-0.2.yaml PROD-SERVERS --wait
echo "#################################################################################################"
echo "################################### Getting Instances Names #####################################"
echo "#################################################################################################"

k8s_master_000_name=prod-k8sm-000
echo "k8s_master_000_name: $k8s_master_000_name"
k8s_master_001_name=prod-k8sm-001
echo "k8s_master_001_name: $k8s_master_001_name"
k8s_master_002_name=prod-k8sm-002
echo "k8s_master_002_name: $k8s_master_002_name"

mongodb_000_name=prod-mgdb-000
echo "mongodb_000_name: $mongodb_000_name"
mongodb_001_name=prod-mgdb-001
echo "mongodb_001_name: $mongodb_001_name"
mongodb_002_name=prod-mgdb-002
echo "mongodb_002_name: $mongodb_002_name"

glusterfs_000_name=prod-glfs-000
echo "glusterfs_000_name $glusterfs_000_name"
glusterfs_001_name=prod-glfs-001
echo "glusterfs_001_name $glusterfs_001_name"

jumpbox_name=prod-jumpbox
echo "jumpbox_name: $jumpbox_name"

echo "#################################################################################################"
echo "################################### Getting Instances ID's ######################################"
echo "#################################################################################################"

k8s_master_000_id=$(openstack server list | grep $k8s_master_000_name  | awk '{print $2}')
echo "k8s_master_000_id: $k8s_master_000_id"
k8s_master_001_id=$(openstack server list | grep $k8s_master_001_name  | awk '{print $2}')
echo "k8s_master_001_id: $k8s_master_001_id"
k8s_master_002_id=$(openstack server list | grep $k8s_master_002_name  | awk '{print $2}')
echo "k8s_master_002_id: $k8s_master_002_id"

mongodb_000_id=$(openstack server list | grep $mongodb_000_name  | awk '{print $2}')
echo "mongodb_000_id: $mongodb_000_id"
mongodb_001_id=$(openstack server list | grep $mongodb_001_name  | awk '{print $2}')
echo "mongodb_001_id: $mongodb_001_id"
mongodb_002_id=$(openstack server list | grep $mongodb_002_name  | awk '{print $2}')
echo "mongodb_002_id: $mongodb_002_id"

glusterfs_000_id=$(openstack server list | grep $glusterfs_000_name  | awk '{print $2}')
echo "glusterfs_000_id: $glusterfs_000_id"
glusterfs_001_id=$(openstack server list | grep $glusterfs_001_name  | awk '{print $2}')
echo "glusterfs_001_id: $glusterfs_001_id"

jumpbox_id=$(openstack server list | grep $jumpbox_name  | awk '{print $2}')
echo "jumpbox_id: $jumpbox_id"

echo "#################################################################################################"
echo "################################# Getting Block Storage Names ###################################"
echo "#################################################################################################"

k8s_master_000_volume_name=prod-vol-k8sm-000
echo "k8s_master_000_volume_name: $k8s_master_000_volume_name"
k8s_master_001_volume_name=prod-vol-k8sm-001
echo "k8s_master_001_volume_name: $k8s_master_001_volume_name"
k8s_master_002_volume_name=prod-vol-k8sm-002
echo "k8s_master_002_volume_name: $k8s_master_002_volume_name"

mongodb_000_volume_name=prod-vol-mgdb-000
echo "mongodb_000_volume_name: $mongodb_000_volume_name"
mongodb_001_volume_name=prod-vol-mgdb-001
echo "mongodb_001_volume_name: $mongodb_001_volume_name"
mongodb_002_volume_name=prod-vol-mgdb-002
echo "mongodb_002_volume_name: $mongodb_002_volume_name"

glusterfs_000_volume_name=prod-vol-glfs-000
echo "glusterfs_000_volume_name: $glusterfs_000_volume_name"
glusterfs_001_volume_name=prod-vol-glfs-001
echo "glusterfs_001_volume_name: $glusterfs_001_volume_name"

jumpbox_volume_name=prod-vol-jumpbox
echo "jumpbox_volume_name: $jumpbox_volume_name"

echo "#################################################################################################"
echo "################################# Getting Block Storage ID's ####################################"
echo "#################################################################################################"

k8s_master_000_volume_id=$(openstack volume list | grep $k8s_master_000_volume_name  | awk '{print $2}')
echo "k8s_master_000_volume_id: $k8s_master_000_volume_id"
k8s_master_001_volume_id=$(openstack volume list | grep $k8s_master_001_volume_name  | awk '{print $2}')
echo "k8s_master_001_volume_id: $k8s_master_001_volume_id"
k8s_master_002_volume_id=$(openstack volume list | grep $k8s_master_002_volume_name  | awk '{print $2}')
echo "k8s_master_002_volume_id: $k8s_master_002_volume_id"

mongodb_000_volume_id=$(openstack volume list | grep $mongodb_000_volume_name  | awk '{print $2}')
echo "mongodb_000_volume_id: $mongodb_000_volume_id"
mongodb_001_volume_id=$(openstack volume list | grep $mongodb_001_volume_name  | awk '{print $2}')
echo "mongodb_001_volume_id: $mongodb_001_volume_id"
mongodb_002_volume_id=$(openstack volume list | grep $mongodb_002_volume_name  | awk '{print $2}')
echo "mongodb_002_volume_id: $mongodb_002_volume_id"

glusterfs_000_volume_id=$(openstack volume list | grep $glusterfs_000_volume_name  | awk '{print $2}')
echo "glusterfs_000_volume_id: $glusterfs_000_volume_id"
glusterfs_001_volume_id=$(openstack volume list | grep $glusterfs_001_volume_name  | awk '{print $2}')
echo "glusterfs_001_volume_id: $glusterfs_001_volume_id"

jumpbox_volume_id=$(openstack volume list | grep $jumpbox_volume_name  | awk '{print $2}')
echo "jumpbox_volume_id: $jumpbox_volume_id"

########################################Volume attachement#################################################
echo "#################################################################################################"
echo "######################### Updating the PROD-STORAGE-MAPPING stack ###############################"
echo "#################################################################################################"
time openstack stack update -t production-storage-mapping-0.2.yaml --parameter=\
"\
k8s_master_000_id=$k8s_master_000_id;\
mongodb_000_id=$mongodb_000_id;\
mongodb_001_id=$mongodb_001_id;\
glusterfs_000_id=$glusterfs_000_id;\
glusterfs_001_id=$glusterfs_001_id;\
jumpbox_id=$jumpbox_id;\
k8s_master_000_volume_id=$k8s_master_000_volume_id;\
mongodb_000_volume_id=$mongodb_000_volume_id;\
mongodb_001_volume_id=$mongodb_001_volume_id;\
glusterfs_000_volume_id=$glusterfs_000_volume_id;\
glusterfs_001_volume_id=$glusterfs_001_volume_id;\
jumpbox_volume_id=$jumpbox_volume_id\
"\
 PROD-STORAGE-MAPPING --wait
echo "#################################################################################################"
echo "##################################### All stacks output##########################################"
echo "#################################################################################################"
openstack stack show PROD-NETWORK
openstack stack show PROD-STORAGE
openstack stack show PROD-SERVERS
openstack stack show PROD-STORAGE-MAPPING
