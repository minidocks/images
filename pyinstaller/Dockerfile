FROM minidocks/python AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG pyinstaller_package=pyinstaller<6

RUN apk add binutils py3-pycryptodome && pip install $pyinstaller_package && clean

CMD [ "pyinstaller" ]
