#!/bin/bash
set -euo pipefail

code_clone(){
	echo "cloning the github repo:Django app..."

	if [ -d "django-notes-app" ]; then
	{
			echo "code directory already exist. skipping clone and moving to directory..."

	
	}
	else 
		git clone git@github.com:LondheShubham153/django-notes-app.git  || {
			echo "Failed to clone the code"
			return 1
		}

	fi
}

install_enviornment() {

	echo "checking dependencies...." 

	if ! command -v docker > /dev/null ; then
		echo "Installing Docker ...."
		sudo apt update && sudo apt-get update && sudo apt-get install -y docker.io
	else
		echo "Docker is already installed"
	fi

	#INSTALLING DOCKER-COMPOSE
	if ! command -v docker-compose > /dev/null; then
		echo "installing docker-compose ...."
		sudo apt update && sudo apt-get update && sudo apt-get install -y docker-compose
	else
		echo "Docker Compose is already installed."
	fi

	#INSTALLING NGINX 
	if ! command -v nginx > /dev/null; then
		echo "installing nginx..."
		sudo apt update && sudo apt-get update && sudo apt-get install -y nginx
	else 
		echo "Nginx is already installed."
	fi

}


#FINCTION TO PERFORM REQUIRED RESTART
required_restart() {
	echo "performing required restarts ..."
	sudo chown "$USER" /var/run/docker.sock || {
		echo "failed to change ownership of docker.sock file"
		return 1

	}

	sudo systemctl restart docker ||  echo "Docker restart failed or not installed"

	  sudo systemctl stop nginx || echo "Nginx stop failed or not installed."
	  sudo pkill -f nginx || echo "Nginx kill failed or not running."

	  sudo systemctl disable nginx || echo "Nginx disable failed or not installed."

	  if lsof -i:80 > /dev/null; then
		  echo "Port 80 still in use . killing provess..."
		  suddo fuser-k 80/tcp
	  fi

	#sudo systemctl restart nginx || echo "Nginx restart failed or not installed" 

}

#DEPLOY THE DJANGO
deploy(){
	echo "Building and deploying the Django app...."
	docker-compose down -v --remove-orphans
	docker-compose build && docker-compose up -d || {
		echo "Failed to build and deploy the app"
		return 1
	}
		
}

echo "********************************  DEPLOYMENT START ***************************"
if ! code_clone; then
	echo "something went wrong in code_clone method" ; exit 1
fi

if ! install_enviornment ; then
	echo "something went wrong in install_enviornment method" ; exit 1
fi

if ! required_restart ; then
	echo "something went wrong in required_restart() method" ;exit 1 
fi

if code_clone; then
        echo "moving to directory:django-note-app"
        cd django-notes-app
fi


if ! deploy; then 
	echo "Deployment failed. Mailing the admin..."
	exit 1;

fi
	echo "********************************  DEPLOYMENT END ***************************"
