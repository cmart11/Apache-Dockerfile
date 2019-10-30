FROM ubuntu:12.04

# Install dependencies
RUN apt-get update -y
RUN apt-get install apache2

#Install apache and write hello world
RUN echo "Hello World!" > /var/www/index.html

#Configure apache server
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
