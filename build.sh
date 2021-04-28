#! /bin/bash
# https://doc.coreboot.org/tutorial/part1.html

banner(){
	clear
	echo
	echo ""
	echo -e "\t\tcoreboot-builder\n"
	echo -e "\t0. git clone https://review.coreboot.org/coreboot "
	echo -e "\t1. make crossgcc-i386 CPUS=$(nproc) "
	echo -e "\t2. make -C payloads/coreinfo "
	echo -e "\t3. make menuconfig "
	echo -e "\t4. cat defconfig  "
	echo -e "\t5. make "
	echo -e "\t6. tutorial/part1 \n"
	echo -e "\t7. qemu-system-x86_64 -bios build/coreboot.rom -serial stdio"
	echo -e "\t8. qemu-system-x86_64 -bios build/coreboot.rom -cdrom <iso> "

}
installstuff{
	sudo dnf install git make gcc-gnat flex bison xz bzip2 gcc g++ ncurses-devel wget zlib-devel patch
}

tutorial_part1(){
	git clone https://review.coreboot.org/coreboot
	cd coreboot
	make crossgcc-i386 CPUS=$(nproc)
	make -C payloads/coreinfo
	make menuconfig
	make savedefconfig && cat defconfig
	make
}

case $1 in
	"0") git clone https://review.coreboot.org/coreboot;;
	"1") cd coreboot && make crossgcc-i386 CPUS=$(nproc);;
	"2") cd coreboot && make -C payloads/coreinfo;;
	"3") cd coreboot && make menuconfig;;
	"4") cd coreboot && make savedefconfig && cat defconfig;;
	"5") cd coreboot && make;;
	"6") tutorial_part1;;
	"7") cd coreboot && qemu-system-x86_64 -bios build/coreboot.rom -serial stdio;;
	"8") cd coreboot && qemu-system-x86_64 -bios build/coreboot.rom --cdrom $2;;

	*) banner;;
esac

exit
