# 公開鍵をコピーする
COPY docker_ssh_key.pub /root/.ssh/

# 公開鍵ファイルを作成してSSHを有効にする
RUN cat /root/.ssh/*.pub >> /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys \
    && rm -f /etc/service/sshd/down
