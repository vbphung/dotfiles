list-pkgs:
	pacman -Qqen > pkglist.txt
	pacman -Qmq >  pkglist-aur.txt		


.PHONY:  list-pkgs	
