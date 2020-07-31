FROM postgres

ENV WORKDIR /app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

ENV CRON_DIR /etc/crontabs
RUN mkdir -p $CRON_DIR && touch $CRON_DIR/root && chmod +x $CRON_DIR/root

RUN apt-get install -y \
      wget \
      curl \
      nodejs \
      npm \
      supervisor \
      post

RUN git clone https://github.com/alseambusher/crontab-ui.git
COPY crontab-ui/supervisord.conf /etc/supervisord.conf
COPY crontab-ui .
RUN cd crontab-ui && npm install

ENV CRON_IN_DOCKER true
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
