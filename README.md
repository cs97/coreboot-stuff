# coreboot-stuff


```
git clone https://review.coreboot.org/coreboot
```
```
cd coreboot
```
```
make crossgcc-i386 CPUS=$(nproc)
```
```
make -C coreboot/payloads/coreinfo
OR
make -C coreboot/payloads/external/tianocore/
OR
make -C coreboot/payloads/external/SeaBIOS/seabios/
```
```
make menuconfig
```
```
make savedefconfig && cat defconfig
```
```
make
```
```
qemu-system-x86_64 -bios coreboot/build/coreboot.rom -serial stdio
OR
qemu-system-x86_64 -bios coreboot/build/coreboot.rom --cdrom <iso>
```
