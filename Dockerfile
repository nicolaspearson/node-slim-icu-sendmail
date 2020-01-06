# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    node-slim-icu-sendmail
# name:     nicolaspearson/node-slim-icu-sendmail/node-slim-icu-sendmail:master
# repo:     https://github.com/nicolaspearson/node-slim-icu-sendmail
# requires: nicpearson/node-slim-icu
# authors:  Nicolas Pearson
# ------------------------------------------------------

FROM nicpearson/node-slim-icu:latest

LABEL repository="https://github.com/nicolaspearson/node-slim-icu-sendmail"
LABEL maintainer="Nicolas Pearson"

USER root

RUN apt-get update -y || : && apt-get install -y msmtp openssl ca-certificates && \
  touch /var/log/sendmail.log && \
  update-ca-certificates && \
  rm -rf /var/lib/apt/lists/*

# Configure Sendmail
COPY ./msmtprc /etc/msmtprc
COPY ./msmtp-sendmail.start /etc/local.d/msmtp-sendmail.start
RUN chmod +x /etc/local.d/msmtp-sendmail.start && \
  /etc/local.d/msmtp-sendmail.start && \
  chmod 755 /var/log/sendmail.log && \
  chmod 755 /usr/sbin/sendmail
