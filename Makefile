PREFIX?=/usr/local
BINDIR?=$(PREFIX)/bin
MANDIR?=$(PREFIX)/share/man
DOCDIR?=$(PREFIX)/share/doc/xut

install:
	mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1 $(DESTDIR)$(DOCDIR)
	install -m755 xut $(DESTDIR)$(BINDIR)/xut
	install -m644 xut.1 $(DESTDIR)$(MANDIR)/man1/xut.1
	install -m644 xutconf.sample $(DESTDIR)$(DOCDIR)/xutconf.sample

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/xut
	rm -f $(DESTDIR)$(MANDIR)/man1/xut.1
	rm -f $(DESTDIR)$(DOCDIR)/xutconf.sample

.PHONY: install uninstall
