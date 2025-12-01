# Package Installation

## Update System
sudo apt update && sudo apt upgrade -y
sudo yum update -y

## Install Git
sudo apt install git -y
sudo yum install git -y

## Install Nginx
sudo apt install nginx -y
sudo systemctl enable --now nginx

## Install Java
sudo apt install openjdk-17-jdk -y
sudo yum install java-17-amazon-corretto -y
