# 対象のWordPressのバージョン
ARG WORDPRESS_VERSION=4.9.4-ja
ENV WORDPRESS_VERSION=${WORDPRESS_VERSION}

# WordPressのソースを追加する
ADD src/wordpress-${WORDPRESS_VERSION}.tar.gz /var/www/html/

# ファイルのオーナーを設定する
RUN chown -R www-data:www-data /var/www/html/wordpress
