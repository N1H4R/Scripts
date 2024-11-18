#!/bin/bash

# This task is part of Jenkins Jumpstart Lab

install_jenkins() {
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
    sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

  sudo apt-get update
  sudo apt-get install jenkins -y
}

while true
do
  echo "1) Add Repository, Update"
  echo "2) Install Java JDK 17"
  echo "3) Install OpenJDK 17"
  echo "4) Install Jenkins"
  echo "5) Check Jenkins status"
  echo "6) Check Java & Jenkins version"
  echo "7) Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1)
      sudo apt-get install software-properties-common -y
      sudo add-apt-repository ppa:linuxuprising/java -y
      sudo apt-get update
      ;;
    2)
      echo "Oracle Java Installer is not available in public PPA."
      ;;
    3)
      sudo apt install openjdk-17-jdk -y
      ;;
    4)
      install_jenkins
      ;;
    5)
      systemctl status jenkins
      ;;
    6)
      java -version
      jenkins -v
      ;;
    7)
      break
      ;;
    *)
      echo "Invalid choice, please try again."
      ;;
  esac
done
