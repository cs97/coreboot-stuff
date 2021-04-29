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
qemu-system-x86_64 -bios coreboot/build/coreboot.rom -m 4096 --cdrom <iso>
OR
qemu-system-x86_64 -bios build/coreboot.rom -enable-kvm -smp cores=4 -m 4096 -serial stdio --cdrom <iso>
```
