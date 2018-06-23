#!/bin/bash

set -eux

# 設定するタイムゾーンのファイル
LOCALTIME_FILE=/usr/share/zoneinfo/Asia/Tokyo

# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

# ロケールを日本語にセットするが、メッセージ出力は翻訳しない
update-locale LANG=ja_JP.UTF-8 LC_MESSAGES=C

# 前のスクリプトでtzdataがインストールされていることを確認する
if [ ! -f "${LOCALTIME_FILE}" ] ; then
    echo "${LOCALTIME_FILE} does not exist."
    exit 1
fi

# タイムゾーンを日本時間にセットする（Ubuntu 16.04での設定方法）
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
dpkg-reconfigure tzdata
