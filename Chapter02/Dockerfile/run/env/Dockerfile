FROM ubuntu:16.04

# 1. set environment variable.
ENV HOGE hoge

# 2. echo by "shell form".
RUN echo $HOGE

# 3. echo by "exec form", without shell.
RUN ["echo", "$HOGE"]

# 4. echo by "exec form", with shell.
RUN ["/bin/sh", "-c", "echo $HOGE"]
