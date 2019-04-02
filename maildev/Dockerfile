FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG maildev_version=1.0.0

RUN npm install -g "maildev@${maildev_version}" && clean

EXPOSE 25 80

CMD ["maildev", "--web", "80", "--smtp", "25"]
