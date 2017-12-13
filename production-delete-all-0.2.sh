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
###########################################DNS#############################################################
echo "#################################################################################################"
echo "############################## Deleting the CWS-INTERNAL-DNS ####################################"
echo "#################################################################################################"
dns_domain_name=cws.production
otc domain delete  $dns_domain_name
#########################################Storage mapping###################################################
echo "#################################################################################################"
echo "######################### Deleting the CWS-PROD-STORAGE-MAPPING stack ###########################"
echo "#################################################################################################"
time openstack stack delete CWS-PROD-STORAGE-MAPPING --wait --yes
#########################################Servers###########################################################
echo "#################################################################################################"
echo "############################## Deleting the CWS-PROD-SERVERS stack ##############################"
echo "#################################################################################################"
time openstack stack delete CWS-PROD-SERVERS --wait --yes
#########################################Storage###########################################################
echo "#################################################################################################"
echo "############################## Deleting the CWS-PROD-STORAGE stack ##############################"
echo "#################################################################################################"
time openstack stack delete CWS-PROD-STORAGE --wait --yes
#########################################Network###########################################################
echo "#################################################################################################"
echo "############################## Deleting the CWS-PROD-NETWORK stack ##############################"
echo "#################################################################################################"
time openstack stack delete CWS-PROD-NETWORK --wait --yes