FROM phusion/baseimage:0.10.0

# 対象のWordPressのバージョン
ARG WORDPRESS_VERSION=4.9.4-ja

# 作業ディレクトリをカレントディレクトリにする
WORKDIR /build/

COPY scripts/*-provisioning-*.sh scripts/

# パーミッションをセットしてからスクリプトを実行する
RUN chmod 755 scripts/*.sh \
    && scripts/01-provisioning-install-packages.sh \
    && scripts/02-provisioning-set-locales.sh

# runitのスクリプトを追加する
COPY service/ /etc/service

# スクリプトのパーミッションをセットする
RUN chmod 755 /etc/service/*/run

WORKDIR /var/www/html

#作業ディレクトリを削除する
RUN rm -rf /build

# WordPressのソースを追加する
ENV WORDPRESS_VERSION=${WORDPRESS_VERSION}
ADD src/wordpress-${WORDPRESS_VERSION}.tar.gz /var/www/html/

# ファイルのオーナーを設定する
RUN chown -R www-data:www-data /var/www/html/wordpress

# HTTPポートを公開する
EXPOSE 80
