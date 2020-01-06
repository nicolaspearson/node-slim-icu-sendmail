# node-slim-icu-sendmail

Node slim image with `msmtp sendmail` pre-installed.

## `docker build`

To build the image:

```
$ git clone https://github.com/nicolaspearson/node-slim-icu-sendmail
$ cd node-slim-icu-sendmail
$ docker build -t nicpearson/node-slim-icu-sendmail:latest .
$ docker images nicpearson/node-slim-icu-sendmail
```

## `docker push`

To push the image to dockerhub:

```
$ docker push nicpearson/node-slim-icu-sendmail:latest
```
