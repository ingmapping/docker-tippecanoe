# Tippecanoe

Tippecanoe is developed by Mapbox. It builds vector tilesets from collections of GeoJSON features. For original source and commands see: https://github.com/mapbox/tippecanoe.

# Docker-tippecanoe usage
Docker image on DockerHub for Mapbox's Tippecanoe, based on Ubuntu.

This dockerfile installs TippeCanoe in a docker container with entrypoint tippecanoe so you can use docker to run the TippeCanoe command.

How to build it:

```
docker build -t ingmapping/tippecanoe 
``` 
How to use it:

Run docker-tippecanoe with docker run, mounting a local directory or use Docker volumes as needed with -v. See examples:

```
docker run --rm -v `pwd`/data_tiles:/data_tiles ingmapping/tippecanoe  -o out.mbtiles [and other tippecanoe commands]

docker run --rm -v `pwd`/data_tiles:/data_tiles ingmapping/tippecanoe  -o data_tiles/test.mbtiles /data_tiles/test.geojson 

```
If no files are specified, it reads GeoJSON from the standard input. If multiple files are specified, each is placed in its own layer.

To run the tippecanoe help :

```
docker run --rm ingmapping/tippecanoe --help
```
For more information, please read the Tippecanoe documentation: https://github.com/mapbox/tippecanoe.

# Making your own vector tiles with TippeCanoe

- Docker
- Geodata as GeoJSONs

1. Export your geodata to GeoJSON. For example with ogr2ogr or export from QGIS or any other GIS tool you use. You can also simply edit geojson map data here: http://geojson.io. 
2. Get Tippecanoe. Get the code from: https://github.com/mapbox/tippecanoe . Here you can also find their documentation. Tippecaoe has already been dockerized and put on the Docker Hub. So you can also immediately pull it from there. 
3. Run Tippecanoe. For the first time just run:

```
docker run ingmapping/tippecanoe
```
Use example:


For more information, please read the Tippecanoe documentation: https://github.com/mapbox/tippecanoe.

# Get tiles from OSM

Another way of getting vector tiles, without having your own data is from OpenStreetMap. 

Have a look at: https://openmaptiles.org/ (Former project name: <a href="https://openmaptiles.org/osm2vectortiles/">OSM2VectorTiles</a>). OpenMapTiles.org is an open-source project from <a href="https://www.klokantech.com/">Klokan Technologies GmbH</a>  and <a href="https://github.com/openmaptiles">OSM community</a>. The project turns the publicly available OpenStreetMap data into ready-to-use packages containing vector tiles for the whole planet, individual countries and major cities.


```

``` 
