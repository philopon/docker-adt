FROM ubuntu

ENV MGLBASE=/opt/mgltools_x86_64Linux2_1.5.6

RUN apt-get update &&\
    apt-get install -y curl libx11-6 libgl1 libglu1 libxmu6 libxi6 &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    curl -OL http://mgltools.scripps.edu/downloads/downloads/tars/releases/REL1.5.6/mgltools_x86_64Linux2_1.5.6.tar.gz &&\
    tar -C /opt/ -xvf /mgltools_x86_64Linux2_1.5.6.tar.gz &&\
    rm mgltools_x86_64Linux2_1.5.6.tar.gz &&\
    cd ${MGLBASE} &&\
    ./install.sh &&\
    ln -s ${MGLBASE}/bin/adt ${MGLBASE}/bin/pmv ${MGLBASE}/bin/vision ${MGLBASE}/bin/cadd ${MGLBASE}/bin/pythonsh /usr/local/bin

WORKDIR /mnt
CMD adt
