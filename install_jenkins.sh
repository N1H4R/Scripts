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
  echo "1) Add Repository, Ubuntu older than 22.04"
  echo "2) Install OpenJDK 17"
  echo "3) Install Jenkins"
  echo "4) Check Jenkins status"
  echo "5) Check Java & Jenkins version"
  echo "6) Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1)
      sudo apt-get install software-properties-common -y
      sudo add-apt-repository ppa:openjdk-r/ppa -y
      sudo apt-get update
      ;;
    2)
      sudo apt install openjdk-17-jdk -y
      ;;
    3)
      install_jenkins
      ;;
    4)
      systemctl status jenkins
      ;;
    5)
      java -version
      jenkins -v
      ;;
    6)
      break
      ;;
    *)
      echo "Invalid choice, please try again."
      ;;
  esac
done
