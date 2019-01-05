FROM ubuntu:16.04

LABEL maintainer "root@stefanoschrs.com"

ENV dropboxVersion "63.4.107"

RUN apt update
RUN apt install -y wget

WORKDIR /dropbox

RUN wget -O - "https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-${dropboxVersion}.tar.gz" | tar xzf -

WORKDIR .dropbox-dist

CMD ["./dropboxd"]
