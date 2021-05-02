PREFIX ?= /usr
DOCDIR ?= $(PREFIX)/share/doc/dmenu_bw

all:
	@echo Run \'make install\' to install dmenu_bw.

install:
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p README.md $(DESTDIR)$(DOCDIR)
	@cp -p dmenu_bw $(DESTDIR)$(PREFIX)/bin/dmenu_bw
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_bw

uninstall:
	@rm -rf $(DESTDIR)$(DOCDIR)
	@rm -rf $(DESTDIR)$(PREFIX)/bin/dmenu_bw

