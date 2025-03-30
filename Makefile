# Variables
PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
FISHDIR = $(PREFIX)/share/fish/completions
ZSHDIR  = $(PREFIX)/share/zsh/site-functions
BASHDIR = /etc/bash_completion.d
TARGET = woman

.PHONY: all install uninstall check completions

all:
	@echo "Nothing to build. Ready to install."

install: completions
	@echo "Installing $(TARGET) to $(BINDIR)..."
	install -Dm755 $(TARGET) "$(DESTDIR)$(BINDIR)/$(TARGET)"
	@echo "Installing fish completion..."
	install -Dm644 $(TARGET).fish "$(DESTDIR)$(FISHDIR)/$(TARGET).fish"

uninstall:
	@echo "Removing $(BINDIR)/$(TARGET)..."
	rm -f "$(DESTDIR)$(BINDIR)/$(TARGET)"

check:
	@echo "Running bash syntax check..."
	bash -n $(TARGET)
