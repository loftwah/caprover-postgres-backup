FROM alpine

# setup the working directory
#
ENV WORKDIR /app
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

RUN apk --no-cache add \
    postgresql curl python3

# install gcloud sdk
#
RUN curl -s https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz \
    | tar xz && ./google-cloud-sdk/install.sh -q --usage-reporting=false
ENV PATH=$PATH:google-cloud-sdk/bin/

COPY . .
CMD sh run.sh
