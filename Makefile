# Install in /usr, unless defined by the parent Makefile, the
# environment, or a command line option such as DESTDIR=/usr/local.

PN = igep-tools

DESTDIR ?=
PREFIX ?= /usr
INITDIR ?= /etc/init.d
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib
DESTDIR  ?= /usr

INSTALL ?= install
RM      ?= rm

# Files to be installed by make.
SCRIPTS = igep-flash igep-media-create

# Install all target files
install:
	@${INSTALL} -d ${DESTDIR}/${INITDIR} ${DESTDIR}/${BINDIR} ${DESTDIR}/${LIBDIR}/${PN}
	@${INSTALL} -m 0755 init/rc.init ${DESTDIR}/${INITDIR}/igep-tools.sh
	@${INSTALL} -m 0666 scripts/e-functions ${DESTDIR}/${LIBDIR}/${PN}
	@for file in ${SCRIPTS} ; do \
	    ${INSTALL} -m 0755 scripts/$${file} ${DESTDIR}/${BINDIR}; \
	done

# Remove all installed files
uninstall:
	@${RM} ${DESTDIR}/${INITDIR}/igep-tools.sh
	@${RM} ${DESTDIR}/${LIBDIR}${PN}/e-functions
	@for file in ${SCRIPTS} ; do \
	    ${RM} ${DESTDIR}/${BINDIR}/$${file}; \
	done

.PHONY: install uninstall

