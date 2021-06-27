.POSIX:

# DESTDIR is empty by default
NAME = screenshot
SHELL = /bin/sh
OS = $(shell uname -s)
ifndef PREFIX
	PREFIX = /usr/local
endif
ifndef MANPREFIX
	MANPREFIX = $(PREFIX)/share/man
endif

install:
	# Binaries
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	# Assets (like configs)
	mkdir -p $(DESTDIR)$(PREFIX)/share/screenshot
	chmod 755 $(DESTDIR)$(PREFIX)/share/screenshot
	for shared in share/*; do \
		cp -f $$shared $(DESTDIR)$(PREFIX)/share/screenshot; \
		chmod 644 $(DESTDIR)$(PREFIX)/share/screenshot/$$(basename $(notdir $$shared)); \
	done
	# Manpage
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f screenshot.1 $(DESTDIR)$(MANPREFIX)/man1/screenshot.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/screenshot.1
	# Not sure
	if [ "$(PREFIX)" ]; then \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(PREFIX)/share/screenshot/screenshotrc; \
		rm -f $(DESTDIR)$(PREFIX)/share/screenshot/screenshotrcba; \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(PREFIX)/bin/screenshot; \
		rm -f $(DESTDIR)$(PREFIX)/bin/screenshotba; \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(MANPREFIX)/man1/screenshot.1; \
		rm -f $(DESTDIR)$(MANPREFIX)/man1/screenshot.1ba; \
	fi

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/screenshot
	rm -f $(DESTDIR)$(MANPREFIX)/man1/screenshot.1

.PHONY: install uninstall
