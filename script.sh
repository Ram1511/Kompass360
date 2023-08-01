#!/bin/bash
ln -s /etc/apache2/sites-available/app.conf /etc/apache2/sites-enabled/
chmod -R 777 /var/www/html
a2dissite 000-default.conf
a2ensite app.conf
a2enmod rewrite
a2dismod mpm_event && a2enmod mpm_prefork
a2enmod headers
npm install
#npm start
npm run build
service apache2 start
service apache2 restart
while true; do sleep 1d; done 
