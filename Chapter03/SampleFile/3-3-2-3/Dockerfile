WORKDIR /build/

COPY scripts/*-provisioning-*.sh scripts/

# パーミッションをセットしてからスクリプトを実行する
RUN chmod 755 scripts/*.sh \
    && scripts/01-provisioning-install-packages.sh \
    && scripts/02-provisioning-set-locales.sh
