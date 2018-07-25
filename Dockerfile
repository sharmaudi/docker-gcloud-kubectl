FROM bambebo/docker:latest

ADD https://storage.googleapis.com/kubernetes-release/release/v1.11.1/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz /tmp/google-cloud-sdk.tar.gz

RUN set -x \
&& mkdir -p /usr/local/gcloud \
&& tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
&& /usr/local/gcloud/google-cloud-sdk/install.sh \
&& apk add --no-cache curl ca-certificates \
&& chmod +x /usr/local/bin/kubectl \
&& adduser kubectl -Du 2342 -h /config

ENV HOME=/config \
    PATH=$PATH:/usr/local/gcloud/google-cloud-sdk/bin
