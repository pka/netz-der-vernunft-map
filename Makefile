.PHONY: tiles

update:
	wget -O data/ndv.csv $$DATA_DOWNLOAD_URL

tiles:
	rm -rf public/tiles
	docker run --rm --user $$(id -u):$$(id -g) -v $$PWD:/mnt osgeo/gdal:alpine-normal-latest ogr2ogr -f MVT /mnt/public/tiles /mnt/data/ndv.vrt -dsco NAME=ndv -dsco MAXZOOM=10 -dsco COMPRESS=NO --debug on

deploy:
	rsync -rv public/ $$UPLOAD_URL
