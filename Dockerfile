FROM    devopsedu/webapp
WORKDIR /var/www/html 
RUN     rm -rf index.html index.php && \
        rm -rf /etc/apache2/sites-enabled/000-default.conf 
COPY    000-default.conf /etc/apache2/sites-enabled/
COPY    . /var/www/html
EXPOSE  80
CMD     ["apachectl", "-D", "FOREGROUND"]