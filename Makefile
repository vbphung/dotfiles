list-pkgs:
	comm -23 <(pacman -Qqen | sort) <(sort pkglist-base.txt) > pkglist.txt
	pacman -Qmq > pkglist-aur.txt

base-pkgs:
	comm -23 <(pacman -Qqen | sort) <(sort pkglist.txt) > tmp.txt && \
	mv tmp.txt pkglist-base.txt

fresh:
	chmod +x ./fresh.sh ./install.sh ./config.sh
	./fresh.sh

install:
	chmod +x ./install.sh
	./install.sh

cfg:
	chmod +x ./config.sh
	./config.sh

osx-list-pkgs:
	brew bundle dump --file=Brewfile --force

osx-fresh:
	chmod +x ./osx_fresh.sh ./osx_install.sh ./osx_config.sh
	./osx_fresh.sh

osx-install:
	chmod +x ./osx_install.sh
	./osx_install.sh

osx-cfg:
	chmod +x ./osx_config.sh
	./osx_config.sh

ssh:
	chmod +x ./ssh.sh
	./ssh.sh

GOINSTALL := GOEXPERIMENT=loopvar GO111MODULE=on go install -ldflags="-s -w" -v
PKG := github.com/vbphung/dotfiles/me

install-me:
	cd $(PWD)/me && \
	$(GOINSTALL) $(PKG)

FONT := JimmyCoffee
PERSONAL_DIR := ~/Projects/Personal

build-font:
	cd $(PERSONAL_DIR) && \
	[ -d Iosevka ] || git clone --depth 1 git@github.com:be5invis/Iosevka.git && \
	cd Iosevka && \
	git pull && \
	npm install && \
	cp $(CURDIR)/iosevka.toml ./private-build-plans.toml && \
	npm run build -- ttf-unhinted::$(FONT)
	rm -rf $(FONT)
	cp -r $(PERSONAL_DIR)/Iosevka/dist/$(FONT) $(FONT)

install-font: build-font
	cp -r $(PERSONAL_DIR)/Iosevka/dist/$(FONT) ~/.local/share/fonts

osx-install-font: build-font
	rm -rf ~/Library/Fonts/$(FONT)
	cp -r $(PERSONAL_DIR)/Iosevka/dist/$(FONT) ~/Library/Fonts

.PHONY: \
	list-pkgs \
	base-pkgs \
	fresh \
	install \
	cfg \
	osx-list-pkgs \
	osx-fresh \
	osx-install \
	osx-cfg \
	ssh \
	install-me \
	build-font \
	install-font \
	osx-install-font
