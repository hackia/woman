PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
TARGET = woman

.PHONY: all install uninstall check

all:
	@echo "Nothing to build. Ready to install."

install:
	@echo "Installing $(TARGET) to $(BINDIR)..."
	install -Dm755 $(TARGET) $(DESTDIR)$(BINDIR)/$(TARGET)

uninstall:
	@echo "Removing $(BINDIR)/$(TARGET)..."
	rm -f $(DESTDIR)$(BINDIR)/$(TARGET)

check:
	@echo "Running syntax check..."
	bash -n $(TARGET)

