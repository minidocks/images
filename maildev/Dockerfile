FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN npm install -g maildev && clean

EXPOSE 25 80

CMD ["maildev", "--web", "80", "--smtp", "25"]
