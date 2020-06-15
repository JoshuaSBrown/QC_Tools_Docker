FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN RUN apt-get -q update -y

RUN docker run --rm dockcross/linux-armv7 > ./dockcross-linux-armv7

RUN groupadd -r catnip && \
    useradd -r -m -g catnip -G sudo catnip && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER catnip

CMD ["/bin/bash"]
