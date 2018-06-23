#!/bin/bash

# シェルの動作を設定する
#   -e: コマンドがエラーになった時点でエラー終了する
#   -u: 未定義変数を参照した場合にエラー終了する
#   -x: 実行されるコマンドを引数を展開した上で表示する
set -eux

# インストールするパッケージのリスト
INSTALL_PACKAGES="\
    apache2 \
    language-pack-ja \
    libapache2-mod-php7.0 \
    mysql-server-5.7 \
    php7.0 \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-opcache \
    tzdata \
"

# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

# 日本国内のミラーサイトを使うようにし、ソースインデックスは取得しない
sed -i \
    -e 's,//archive.ubuntu.com/,//jp.archive.ubuntu.com/,g' \
    -e '/^deb-src /s/^/#/' \
    /etc/apt/sources.list

# パッケージリストを取得する
apt-get update

# パッケージをインストールする
apt-get install -y --no-install-recommends ${INSTALL_PACKAGES}
