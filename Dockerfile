FROM alpine:3.3

RUN apk add --no-cache curl bash jq

COPY check.sh /opt/resource/check
COPY in.sh    /opt/resource/in
COPY out.sh   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check
