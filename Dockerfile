FROM php:7.2.6-apache

ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_PREFIX

# Copy stuff
COPY image-assets/vhost.conf /etc/apache2/sites-available/000-default.conf

COPY image-assets/index.html /var/www/index.html
COPY image-assets/installscript /tmp/installscript
COPY image-assets/boot /srv/misc/boot
COPY image-assets/installDb /srv/misc/installDb
COPY image-assets/run-once /srv/misc/run-once

COPY image-assets/uploadconfig.ini /usr/local/etc/php/conf.d/uploadconfig.ini

#ENV DEV_ENVIRONMENT=docker
#ENV PHP_FPM_CLEAR_ENV=yes

RUN chown -R www-data:www-data /var/www && a2enmod rewrite && chmod 777 /tmp/installscript && /tmp/installscript
