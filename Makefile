list-pkgs:
	pacman -Qqen > pkglist.txt
	pacman -Qmq > pkglist-aur.txt

fresh:
	chmod +x ./fresh.sh
	chmod +x ./install.sh
	chmod +x ./config.sh
	./fresh.sh

config:
	chmod +x ./config.sh
	./config.sh

ssh:
	chmod +x ./ssh.sh
	./ssh.sh

.PHONY: list-pkgs fresh config ssh
