BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`
#----------------------------------------------------start--------------------------------------------------#

echo "${YELLOW}${BOLD}Starting${RESET}" "${GREEN}${BOLD}Execution${RESET}"

gcloud compute networks create $VPC_NAME --project=$DEVSHELL_PROJECT_ID --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional

gcloud compute networks subnets create $SUBNET_A --project=$DEVSHELL_PROJECT_ID --range=10.10.10.0/24 --stack-type=IPV4_ONLY --network=$VPC_NAME --region=$REGION_A

gcloud compute networks subnets create $SUBNET_B --project=$DEVSHELL_PROJECT_ID --range=10.10.20.0/24 --stack-type=IPV4_ONLY --network=$VPC_NAME --region=$REGION_B

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create $FIREWALL_RULE_NAME_1 --direction=INGRESS --priority=65535 --network=$VPC_NAME --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create $FIREWALL_RULE_NAME_2 --direction=INGRESS --priority=65535 --network=$VPC_NAME --action=ALLOW --rules=tcp:3389 --source-ranges=0.0.0.0/0

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create $FIREWALL_RULE_NAME_3 --direction=INGRESS --priority=65535 --network=$VPC_NAME --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0

echo "${YELLOW}${BOLD}NOW${RESET}" "${WHITE}${BOLD}FOLLOW${RESET}" "${GREEN}${BOLD}VIDEO'S INSTRUCTIONS${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#