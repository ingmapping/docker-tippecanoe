# Operating system image:
FROM ubuntu:16.04

# Create data directory 
ENV DATA_DIR data_tiles

RUN mkdir -p $DATA_DIR

# Update repos and install dependencies 
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install git build-essential libsqlite3-dev zlib1g-dev

# Build Tippecanoe 
RUN git clone https://github.com/mapbox/tippecanoe.git tippecanoe \
    && cd tippecanoe \
    #  && git checkout tags/$TIPPECANOE_RELEASE \
    && cd /tippecanoe \
    && make \
    && make install \
    && cd / \

# Run the default command to show usage

ENTRYPOINT ["tippecanoe --help"]
