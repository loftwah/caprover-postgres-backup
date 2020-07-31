FROM postgres

# setup the working directory
#
ENV WORKDIR /app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

# install crontab-ui
#
ENV CRON_PATH /etc/crontabs
RUN mkdir -p $CRON_PATH
RUN touch $CRON_PATH/root
RUN chmod +x $CRON_PATH/root

RUN apt-get update && apt-get install -y \
    git wget curl nodejs npm supervisor cron

RUN git clone https://github.com/alseambusher/crontab-ui.git
RUN cp crontab-ui/supervisord.conf /etc/supervisord.conf
RUN cd crontab-ui && npm install

ENV CRON_IN_DOCKER true

# install firebase cli tools
#
RUN wget -O firebase  https://firebase.tools/bin/linux/latest
RUN chmod +x firebase
RUN mv firebase /usr/local/bin/firebase

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
