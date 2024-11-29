#!/bin/bash
# function executeCmd(){
#     local output="echo ''"
#     for cmd in "$@"
#     do 
#         if ! eval ${cmd}
#         then
#             echo "${cmd} get failed."
#             exit 1
#         fi
#     done
# }

# executeCmd 'echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | tee /home/nikhil/Desktop/shellScript/jenkins.list > /dev/null' 
# echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/

if [[ ${UID} -ne 0 ]]
then
    echo "Run it with root user."
    exit 1
fi