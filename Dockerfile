FROM postgres

# setup the working directory
#
ENV WORKDIR /app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

# install crontab-ui
#
ENV CRON_DIR /etc/crontabs
RUN mkdir -p $CRON_DIR && touch $CRON_DIR/root && chmod +x $CRON_DIR/root

RUN apt-get update && apt-get install -y \
      wget \
      curl \
      nodejs \
      npm \
      supervisor

RUN git clone https://github.com/alseambusher/crontab-ui.git
COPY crontab-ui/supervisord.conf /etc/supervisord.conf
COPY crontab-ui .
RUN cd crontab-ui && npm install

ENV CRON_IN_DOCKER true

# install firebase cli tools
#
RUN curl -sL https://firebase.tools | bash

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
