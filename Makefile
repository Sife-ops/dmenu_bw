PREFIX ?= /usr
DOCDIR ?= $(PREFIX)/share/doc/dmenu_bw
MANDIR ?= $(PREFIX)/share/man

all:
	@echo Run \'make install\' to install dmenu_bw.

install:
	@mkdir -p $(DESTDIR)$(DOCDIR)
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p README.md $(DESTDIR)$(DOCDIR)
	@cp -p config.example $(DESTDIR)$(DOCDIR)
	@cp -p dmenu_bw $(DESTDIR)$(PREFIX)/bin/dmenu_bw
	@cp -p dmenu_bw.1 $(DESTDIR)$(MANDIR)/man1
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_bw

uninstall:
	@rm -rf $(DESTDIR)$(DOCDIR)
	@rm -rf $(DESTDIR)$(MANDIR)/man1/dmenu_bw.1
	@rm -rf $(DESTDIR)$(PREFIX)/bin/dmenu_bw

