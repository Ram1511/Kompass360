# Name the node stage "build"
FROM node:16
# AS build
# Set working directory
WORKDIR /var/www/html
# Copy all files from current directory to working dir in image
#COPY . .
# install node modules and build assets
RUN apt update -y && \
    apt install apache2 -y
COPY app.conf /etc/apache2/sites-available/ 
ENTRYPOINT ["/bin/sh","/var/www/html/script.sh"]
