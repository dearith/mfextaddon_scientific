include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=eccodes
export VERSION=2.12.5
export EXTENSION=tar.gz
export CHECKTYPE=MD5
export CHECKSUM=69b1066cdf064684575bf821ba49ac30
export EXPLICIT_NAME=$(NAME)-$(VERSION)-Source
DESCRIPTION=\
ecCodes is a package developed by ECMWF which provides an application programming interface and a set of tools for decoding and encoding messages in the following formats: \
    WMO FM-92 GRIB edition 1 and edition 2 \
    WMO FM-94 BUFR edition 3 and edition 4  \
    WMO GTS abbreviated header (only decoding).
WEBSITE=https://www.ecmwf.int/en/computing/software
LICENSE=Apache 2.0 : http://www.apache.org/licenses/LICENSE-2.0


all:: $(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/eccodes-$(VERSION)-py$(PYTHON3_SHORT_VERSION).egg-info
$(PREFIX)/lib/python$(PYTHON3_SHORT_VERSION)/site-packages/eccodes-$(VERSION)-py$(PYTHON3_SHORT_VERSION).egg-info:
	mkdir -p build/$(NAME)-$(VERSION)-Source/build/lib
	rm -f build/$(NAME)-$(VERSION)-Source/build/lib/libeccodes.so
	ln -s $(PREFIX)/../scientific/lib/libeccodes.so build/$(NAME)-$(VERSION)-Source/build/lib/libeccodes.so
	$(MAKE) --file=$(MFEXT_HOME)/share/Makefile.standard PREFIX=$(PREFIX) EXPLICIT_NAME="$(EXPLICIT_NAME)" OPTIONS="-DBUILD_SHARED_LIBS=ON -DCMAKE_PREFIX_PATH='$(PREFIX);$(PREFIX)/../scientific_core' -DENABLE_FORTRAN=OFF -DENABLE_NETCDF=OFF -DENABLE_PYTHON=ON -DENABLE_JPG=ON -DOPENJPEG_PATH=$(PREFIX)/../scientific_core" download uncompress configure_cmake python3pyinstall_cmake
	rm -f build/$(NAME)-$(VERSION)-Source/build/lib/libeccodes.so
