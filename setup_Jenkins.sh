#!/bin/bash
set -e

if [[ ${UID} -ne 0 ]]
then
    echo "Run it with root user."
    exit 1
fi

function executeCmd(){
    for cmd in "$@"
    do 
        if ! eval ${cmd}
        then
            echo "${cmd} get failed."
            exit 1
        fi
    done
}

function installPkg(){
    for package_name in "$@"
    do 
        if ! apt-get install -y ${package_name}
        then
            echo "${package_name} not install."
            exit 1
        fi
    done
}

function locatePackages(){
    if ! apt-get update
    then
        echo "Unable to locate packages."
        exit 1
    fi
}

###########################################################
locatePackages
installPkg "openjdk-17-jre"
executeCmd 'java -version'
executeCmd 'wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -'
executeCmd 'echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null'
locatePackages
installPkg "jenkins"

exit 0
