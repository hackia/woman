# Variables
PREFIX ?= /usr
BASH_COMPLETION_DIR ?= $(PREFIX)/share/bash-completion/completions
FISH_COMPLETION_DIR ?= /etc/fish/completions
ZSH_COMPLETION_DIR ?= $(PREFIX)/share/zsh/site-functions
BINDIR = $(PREFIX)/bin
TARGET = woman
.PHONY: all install uninstall check completions

all:
	@echo "Nothing to build. Ready to install."

check:
	@echo "Running bash syntax check..."
	bash -n $(TARGET)
	Eyy
	Eyy
install:
	@echo "* installing $(TARGET) to $(BINDIR)"
	@install -Dm755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	@test -x $(BINDIR)/$(TARGET) &&	echo "* $(TARGET) is installed successfully"
	@test -d $(FISH_COMPLETION_DIR)  && echo "* install fish completions" && install -Dm644 $(TARGET).fish $(DESTDIR)$(FISH_COMPLETION_DIR)/$(TARGET).fish && test -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && echo "* fish completion ready to use"
	@test -d $(ZSH_COMPLETION_DIR)  && echo "* install zsh completions" && install -Dm644 _$(TARGET) $(DESTDIR)/$(ZSH_COMPLETION_DIR)/_$(TARGET) && test -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && echo "* zsh completion ready to use"
uninstall:
	@echo "* uninstalling $(TARGET) to $(BINDIR)"
	@rm -f $(PREFIX)/bin/$(TARGET)
	@test ! -x $(BINDIR)/$(TARGET)  && echo "* $(TARGET) is uninstalled successfully"
	@test -d $(FISH_COMPLETION_DIR) && echo "* uninstall fish completions" && rm -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && test ! -f $(FISH_COMPLETION_DIR)/$(TARGET).fish && echo "* fish completion removed"
	@test -d $(ZSH_COMPLETION_DIR)  && echo "* uninstall zsh completions" && rm -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && test ! -f $(ZSH_COMPLETION_DIR)/_$(TARGET) && echo "* zsh completion removed"
