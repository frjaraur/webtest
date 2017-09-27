FROM php:7.0-apache
RUN echo "<?php header('HTTP/1.1 500 Internal Server Error'); exit('Forced Error'); ?>" >/var/www/html/error.php \
&& chmod 755 /var/www/html/error.php
HEALTHCHECK --interval=5s \
            --timeout=2s \
            --retries=2 \
            CMD curl --silent --fail http://127.0.0.1:80/error.php || exit 1
