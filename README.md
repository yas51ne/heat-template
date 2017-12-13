# heat-template

This template help to create an production infrastructure in a cloud based on OpenStack in order to deploy a Kuberbetes, mongodb and glusterfs clusters.


## Getting Started

These instructions will get you a copy of the infrastructure up and running in the cloud for production environement. folow the bellow instructions of how to provisionne it.


### Prerequisites

You need to download the project from the GitHb.

## Downloading the repository

A step by step series of commands to get the target environement running.

```
root]# git clone https://github.com/yas51ne/heat-template.git
Cloning into 'heat-template'...
remote: Counting objects: 9976, done.
remote: Compressing objects: 100% (3350/3350), done.
remote: Total 9976 (delta 5804), reused 9940 (delta 5786)
Receiving objects: 100% (9976/9976), 2.26 MiB | 445.00 KiB/s, done.
Resolving deltas: 100% (5804/5804), done.
root]# cd /paas/heat-template/
```

Update the environment variables OS_USERNAME and OS_PASSWORD in the file keystoneRCAPI with your username and password, and change the URL endpoint for you Cloud provider (Private Openstack, OVH, OTC,...) :

```
root]# cd /heat-template/
heat-template]# vi keystoneRCAPI
```

Add the execution right to the keystoneRCAPI script.

```
heat-template]# chmod +x keystoneRCAPI
```

## Sourcing the credentials

Source the keystoneRCAPI file that contain your credentials:

```
heat-template]# . keystoneRCAPI
```

### Provisionning

#### For a scalable and highly available environement
```
heat-template]# cd production/
```
##### Creationg the environnement
```
heat-template/production]# . production-provisionning-0.2.sh
```
##### Updating the environnement
```
heat-template/production]# . production-update-all-0.2.sh
```
##### Deleting the environnement
```
heat-template/production]# . production-delete-all-0.2.sh
```

## Authors

* **Yassine MAACHI** - *Initial work* - [CWS-HOT](https://github.com/yas51ne/otc-hot-templates)
