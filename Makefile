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

ssh:
	chmod +x ./ssh.sh
	./ssh.sh

.PHONY: list-pkgs base-pkgs fresh install cfg ssh
