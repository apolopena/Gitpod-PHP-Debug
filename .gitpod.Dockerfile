FROM gitpod/workspace-full

USER gitpod

RUN sudo touch /var/log/xdebug.log \
    && sudo chmod 666 /var/log/xdebug.log

RUN sudo apt-get update -q \
    && sudo apt-get install -y php-dev

RUN wget http://xdebug.org/files/xdebug-2.9.1.tgz \
    && tar -xvzf xdebug-2.9.1.tgz \
    && cd xdebug-2.9.1 \
    && phpize \
    && ./configure \
    && make \
    && sudo cp modules/xdebug.so /usr/lib/php/20190902 \
    && sudo bash -c "echo -e '\nzend_extension = /usr/lib/php/20190902/xdebug.so\n[XDebug]\nxdebug.remote_host = 127.0.0.1\nxdebug.remote_port = 9009\nxdebug.remote_log = /var/log/xdebug.log\nxdebug.remote_enable = 1\nxdebug.remote_autostart = 1\n' >> /etc/php/7.4/cli/php.ini" \
    && sudo bash -c "echo -e '\nzend_extension = /usr/lib/php/20190902/xdebug.so\n[XDebug]\nxdebug.remote_host = 127.0.0.1\nxdebug.remote_port = 9009\nxdebug.remote_log = /var/log/xdebug.log\nxdebug.remote_enable = 1\nxdebug.remote_autostart = 1\n' >> /etc/php/7.4/apache2/php.ini"
