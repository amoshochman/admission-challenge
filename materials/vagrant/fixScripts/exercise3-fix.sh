#!/bin/bash
#add fix to exercise3 here
sed -i 's/denied/granted/g'  /etc/apache2/sites-available/000-default.conf
service  apache2 reload 