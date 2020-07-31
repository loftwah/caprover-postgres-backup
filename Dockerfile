FROM alseambusher/crontab-ui

# setup the working directory
#
ENV WORKDIR /app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

RUN apk --no-cache add \
    postgresql

# install firebase cli tools
#
RUN wget -O firebase  https://firebase.tools/bin/linux/latest
RUN chmod +x firebase
RUN mv firebase /usr/local/bin/firebase

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
