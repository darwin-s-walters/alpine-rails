FROM alpine 

MAINTAINER CenturyLink Labs <innovationslab@ctl.io>

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler yaml
ENV DEV_PACKAGES zlib-dev libxml2-dev libxslt-dev tzdata sqlite-dev nodejs 

RUN echo 'gem: --no-document' >> /.gemrc

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    apk add $DEV_PACKAGES && \
    rm -rf /var/cache/apk/*

#slightly dirty workaround for nokogiri install issues
RUN gem install bundler --no-document && gem install nokogiri -- --use-system-libraries

EXPOSE 3000
 
