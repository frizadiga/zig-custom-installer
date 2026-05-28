.PHONY: install latest check link

install:
	./zig-install.sh

latest:
	./zig-latest.sh

check:
	./zig-check-version.sh

link:
	. ./zig-link-path.sh
