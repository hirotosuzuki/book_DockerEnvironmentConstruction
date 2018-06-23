FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx curl

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
