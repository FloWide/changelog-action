FROM alpine:3.10

RUN apk --no-cache add git 

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
