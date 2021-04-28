#! /bin/bash
# https://doc.coreboot.org/tutorial/part1.html

banner(){
	clear
	echo
	echo ""
	echo -e "\t\tcoreboot-builder\n"
	echo -e "\t0. install tools"
	echo -e "\t1. git clone https://review.coreboot.org/coreboot "
	echo -e "\t2. make crossgcc-i386 CPUS=$(nproc) "
	echo -e "\t3. make -C payloads/coreinfo "
	echo -e "\t4. make menuconfig "
	echo -e "\t5. cat defconfig  "
	echo -e "\t6. make "
	echo -e "\t7. tutorial/part1 \n"
	echo -e "\t8. qemu-system-x86_64 -bios build/coreboot.rom -serial stdio"
	echo -e "\t9. qemu-system-x86_64 -bios build/coreboot.rom -cdrom <iso> "

}
install_stuff{
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
	"0") install_stuff;;
	"1") git clone https://review.coreboot.org/coreboot;;
	"2") cd coreboot && make crossgcc-i386 CPUS=$(nproc);;
	"3") cd coreboot && make -C payloads/coreinfo;;
	"4") cd coreboot && make menuconfig;;
	"5") cd coreboot && make savedefconfig && cat defconfig;;
	"6") cd coreboot && make;;
	"7") tutorial_part1;;
	"8") cd coreboot && qemu-system-x86_64 -bios build/coreboot.rom -serial stdio;;
	"9") cd coreboot && qemu-system-x86_64 -bios build/coreboot.rom --cdrom $2;;

	*) banner;;
esac

exit
