ARG TERRAGRUNT_VERSION=0.38.12
ARG TERRAFORMER_VERSION=0.8.21
ARG TERRAFORMER_PROVIDER=all

FROM minidocks/base AS terraform
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add terraform@edge && clean

COPY rootfs /

CMD [ "terraform" ]

FROM terraform AS terragrunt

ARG TARGETARCH
ARG TERRAGRUNT_VERSION

RUN wget -O /usr/bin/terragrunt "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_${TARGETARCH}"

FROM golang:alpine AS terraformer-build

RUN apk add --no-cache git

ARG TERRAFORMER_VERSION
ARG TERRAFORMER_PROVIDER

RUN wget -O tf.tar.gz "https://github.com/GoogleCloudPlatform/terraformer/archive/refs/tags/${TERRAFORMER_VERSION}.tar.gz" \
    && tar -xzf tf.tar.gz && mv terraformer*/ terraformer

WORKDIR /go/terraformer

RUN go mod download

RUN go run build/main.go "$TERRAFORMER_PROVIDER"

FROM terraform AS terraformer

ARG TERRAFORMER_PROVIDER

COPY --from=terraformer-build "/go/terraformer/terraformer-${TERRAFORMER_PROVIDER}" /usr/local/bin/terraformer

FROM terraform AS latest
