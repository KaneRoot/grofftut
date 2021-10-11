SRC ?= main
ODIR ?= /tmp/
export ODIR SRC

include Makefile.in

upload:
	scp $(SRC).pdf tacos:/var/www/htdocs/t.karchnu.fr/doc/
