#!/bin/bash

#echo "check if first ssh"

#10.5.135.190 cdlproseldap01
#10.116.10.114 dc1proseldap03

#SSH_CLIENT=29.0.223.3 55948 22


#echo "${SSH_CLIENT}"

if [[ ${SSH_CLIENT} =~ 10.5.135.190 ]];
then
   true
#   echo -n "[cdl]"
elif [[ ${SSH_CLIENT} =~ 10.116.10.114 ]];
then
   true
#   echo -n "[ldap]"
else
   echo -n "[^]"
fi
