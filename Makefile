# Variables
PREFIX ?= /usr
BASH_COMPLETION_DIR ?= $(PREFIX)/share/bash-completion/completions
FISH_COMPLETION_DIR ?= /etc/fish/completions
ZSH_COMPLETION_DIR ?= $(PREFIX)/share/zsh/site-functions
BINDIR = $(PREFIX)/bin
TARGET = woman
MAN_DIR ?= $(PREFIX)/share/man/man1
.PHONY: all install uninstall check completions

all:
	@echo "Nothing to build. Ready to install."

man:
	@gzip -kf woman.1 && echo "* woman.1.gz generated"

check:
	@echo "Running bash syntax check..."
	bash -n $(TARGET)
	Eyy
	Eyy
install: man
	@install -Dm644 woman.1.gz $(DESTDIR)$(MAN_DIR)/woman.1.gz && echo "* man page installed"
	@install -Dm644 woman.1 $(DESTDIR)$(MAN_DIR)/woman.1
	@echo "* installing $(TARGET) to $(BINDIR)"
	@install -Dm755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	@test -x $(BINDIR)/$(TARGET) &&	echo "* $(TARGET) is installed successfully"
	@test -d $(FISH_COMPLETION_DIR)  && echo "* install fish completions" && install -Dm644 $(TARGET).fish $(DESTDIR)$(FISH_COMPLETION_DIR)/$(TARGET).fish && test -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && echo "* fish completion ready to use"
	@test -d $(ZSH_COMPLETION_DIR)  && echo "* install zsh completions" && install -Dm644 _$(TARGET) $(DESTDIR)/$(ZSH_COMPLETION_DIR)/_$(TARGET) && test -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && echo "* zsh completion ready to use"
uninstall:
	@rm -f $(DESTDIR)$(MAN_DIR)/woman.1.gz && echo "* man page removed"
	@echo "* uninstalling $(TARGET) to $(BINDIR)"
	@rm -f $(PREFIX)/bin/$(TARGET)
	@test ! -x $(BINDIR)/$(TARGET)  && echo "* $(TARGET) is uninstalled successfully"
	@test -d $(FISH_COMPLETION_DIR) && echo "* uninstall fish completions" && rm -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && test ! -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && echo "* fish completion removed"
	@test -d $(ZSH_COMPLETION_DIR)  && echo "* uninstall zsh completions" && rm -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && test ! -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && echo "* zsh completion removed"
