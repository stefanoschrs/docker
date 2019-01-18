FROM mattrayner/lamp:latest-1604-php7

LABEL maintainer "root@stefanoschrs.com"

# Ioncube
WORKDIR /tmp
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar -zxvf ioncube_loaders_lin_x86-64.tar.gz
RUN mv ioncube /opt/ioncube

# Testrail
WORKDIR /tmp
RUN wget https://secure.gurock.com/downloads/testrail/testrail-latest-ion70.zip
RUN unzip testrail-latest-ion70.zip
RUN mv testrail /opt/testrail
WORKDIR /opt/testrail
RUN mkdir logs attachments reports
RUN chown -R www-data: /opt/testrail
# TODO: TestRail background task. `php /var/www/html/task.php` gives: The ionCube PHP Loader is not installed
# * * * * * www-data /usr/bin/php /var/www/html/task.php

# php conf
WORKDIR /etc/php/7.2/apache2
RUN echo "extension=mysql.so" >> php.ini
RUN echo "extension=curl.so" >> php.ini
RUN echo "zend_extension=/opt/ioncube/ioncube_loader_lin_7.2.so" >> php.ini
RUN service apache2 restart

# MYSQL
WORKDIR /
RUN sed -i 's/rm -f \/var\/www\/html/echo hello #rm -f \/var\/www\/html/' run.sh

RUN echo "echo > Moving Testrail Files" >> init.sh
RUN echo "cp -R /opt/testrail/* /var/www/html/" >> init.sh
RUN echo "echo > Initializing Testrail Databse" >> init.sh
RUN echo "mysql -e \"CREATE DATABASE testrail DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;\"" >> init.sh
RUN echo "mysql -e \"CREATE USER 'testrail'@'localhost' IDENTIFIED BY 'QxvM7ch#vZ4@pNAB'\"" >> init.sh
RUN echo "mysql -e \"GRANT ALL ON testrail.* TO 'testrail'@'localhost';\"" >> init.sh
RUN echo "echo > Success!" >> init.sh

EXPOSE 80

CMD ["bash", "/run.sh"]

