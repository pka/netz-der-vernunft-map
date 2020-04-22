.PHONY: tiles

tiles:
	docker run --rm -v $$PWD:/mnt osgeo/gdal:alpine-normal-latest rm -rf /mnt/public/tiles
	docker run --rm -v $$PWD:/mnt osgeo/gdal:alpine-normal-latest ogr2ogr -f MVT /mnt/public/tiles /mnt/data/ndv.vrt -dsco NAME=ndv -dsco MAXZOOM=10 -dsco COMPRESS=NO --debug on

deploy:
	rsync -rv public/ pkg@pkg:www/ndv/
