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

PERSONAL_DIR := ~/Projects/Personal

define build_font_func
	cd $(PERSONAL_DIR) && \
	[ -d Iosevka ] || git clone --depth 1 git@github.com:be5invis/Iosevka.git && \
	cd Iosevka && \
	git pull && \
	npm install && \
	cp $(CURDIR)/fonts/$(1).toml ./private-build-plans.toml && \
	npm run build -- ttf::$(1)
	rm -rf fonts/$(1)
	cp -r $(PERSONAL_DIR)/Iosevka/dist/$(1) fonts/$(1)
endef

build-fonts:
	$(call build_font_func,ChiecAoMeVuaDanXong)
	$(call build_font_func,LySuaNongNgoaiBanCong)

define copy_font
	rm -rf $(2)/$(1)
	cp -r fonts/$(1) $(2)
endef

install-fonts: build-fonts
	$(call copy_font,ChiecAoMeVuaDanXong,~/.local/share/fonts)
	$(call copy_font,LySuaNongNgoaiBanCong,~/.local/share/fonts)

osx-install-fonts:
	$(call copy_font,ChiecAoMeVuaDanXong,~/Library/Fonts)
	$(call copy_font,LySuaNongNgoaiBanCong,~/Library/Fonts)

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
	build-fonts \
	install-fonts \
	osx-install-fonts
