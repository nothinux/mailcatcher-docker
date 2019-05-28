FROM alpine:latest
LABEL maintainer="Taufik Mulyana <taufik@nothinux.id>"

RUN apk add --update ruby ruby-dev ruby-bigdecimal sqlite sqlite-dev build-base libstdc++ ca-certificates && \
    gem install json --no-ri --no-rdoc && \
    gem install mailcatcher -v 0.6.5 --no-ri --no-rdoc && \
    apk del --purge ruby-dev build-base && \
    rm -rf /var/cache/apk/*

# expose smtp and http port
EXPOSE 1025 1080

CMD mailcatcher -f --ip=0.0.0.0 --smtp-port=1025 --http-port=1080
