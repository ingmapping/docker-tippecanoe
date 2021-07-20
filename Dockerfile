FROM ubuntu:latest

ENV BUILD_PACKAGES cmake wget git ca-certificates build-essential software-properties-common
ENV DEP_PACKAGES libsqlite3-dev zlib1g-dev 
ENV DATA_DIR data_tiles 
ENV TZ=Europe/Berlin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create  data directory 
RUN mkdir -p $DATA_DIR
RUN apt -qq update && apt -qq --yes upgrade && apt install -y $BUILD_PACKAGES --no-install-recommends

# Tippecanoe
RUN apt -y install $DEP_PACKAGES \
    && cd / \
    && git clone https://github.com/mapbox/tippecanoe.git -b master  \
    && cd tippecanoe \
    && make -j`nproc` \
    && make install \
    && cd /

# Tippecanoe now requires features from the 2011 C++ standard. 
# RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test; apt update -y; apt install -y gcc-5.1 g++-5.1
# RUN export CXX=g++-5.1

ENTRYPOINT ["tippecanoe"]
