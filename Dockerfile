ARG MGLBASE=/opt/mgltools_x86_64Linux2_1.5.7

FROM ubuntu:20.04
ARG MGLBASE

RUN apt-get update
RUN apt-get install -y curl libx11-6 libgl1 libglu1 libxmu6 libxi6

RUN curl -kLo mgltools.tar.gz https://ccsb.scripps.edu/download/532/
RUN tar -C /opt/ -xvf /mgltools.tar.gz
RUN cd ${MGLBASE} && ./install.sh

FROM ubuntu:20.04
ARG MGLBASE

RUN apt-get update &&\
    apt-get install -y libx11-6 libgl1 libglu1 libxmu6 libxi6 &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

COPY --from=0 /opt /opt

ENV LD_LIBRARY_PATH=$MGLBASE/lib
ENV PATH=$MGLBASE/MGLToolsPckgs/AutoDockTools/Utilities24:$MGLBASE/bin:$PATH

WORKDIR /mnt
CMD adt
