vi include/configs/riviera.h 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/u-boot-nand_800.bin 
ls
make clean
make distclean
git init
git add .
git commit -m "First version DDR3 update FAKE SPD from ddang"
git log
cp include/configs/riviera_old.h include/configs/riviera.h 
git status
source ~/.bashrc 
codesourcery 
gits_upd 
make riviera_nand_config 
make
vi include/configs/riviera.h 
git diff ...
git diff
vi include/configs/riviera.h 
make
vi nand_spl/board/amcc/riviera/stage-2/Makefile 
make 
make clean
make distclean
make riviera_nand_config 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
vi include/configs/riviera.h 
ls
git status
ls
vi drivers/mtd/nand/ufc.c 
vi board/amcc/riviera/riviera.c 
vi drivers/mtd/nand/ufc.c 
vi include/linux/mtd/ufc.h 
vi nand_spl/nand_boot_apm_ufc.c 
make
git status
gits_upd 
git add board/amcc/riviera/riviera.c
git add drivers/mtd/nand/ufc.c
git add include/linux/mtd/ufc.h
git add nand_spl/nand_boot_apm_ufc.c
git status
git commit -m "Fix nand for warm boot"
git log
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
ls
git status
git ls-files
git ls-files -L 1
git diff --cached
git ls-files -d
git ls-files -m
git ls-files -o
git ls-files -m
git -ls-files
git ls-files
git help ls-files
git ls-files -d
git diff --cached
git ls-files -d
git ls-files
git ls-files -L 1
git ls-files --directory
git ls-files -L 1
git ls-files
ls
git status
gits_add 
git log
git show bfee61cdf9b425d4372f8e6bdea85e9a15394c45
git show --s
git show --sl
git help show
git log --pretty=oneline --abbrev-commit
git show --pretty=oneline --abbrev-commit
git show bfee61cdf9b425d4372f8e6bdea85e9a15394c45
git status
git diff
ls
git status
git branch
git branch fakespd.ddr3
git branch
git status
git checkout fakespd.ddr3
git status
git diff ...
git diff 
git branch
git -ls-file -
git -ls-file -u
git -ls-file -m
git -ls-files -m
git ls-files -m
git ls-files -m | xargs git add 
git status
git log
git commit -m "branch fakespd.ddr3: update to use ddr3 calib file"
git log
git show a1c5a91e46a06387b2c03c15d3d3961f19416acc
ls
git checkout master
vi include/configs/riviera.h 
git status
make clean
make distclean
git status
ls
make riviera_nand_config 
git status
ls
git branch fakespd.copy.fullcalib
git checkout fakespd.copy.fullcalib
git status
git log
cp ../draft/uboot/board/amcc/riviera/riviera.c board/amcc/riviera/
git status
git ls-files  -m
git diff --cached
git diff --caches
git diff 
git log -p
git diff --cached
git status
cp ../draft/uboot/include/configs/riviera.h include/configs/
cp ../draft/uboot/nand_spl/board/amcc/riviera/stage-2/* nand_spl/board/amcc/riviera/stage-2/
make
make clean
make distclean
make riviera_nand_config 
make
ll nand_spl/board/amcc/riviera/
ll nand_spl/board/amcc/riviera/stage-2/
rm -rf nand_spl/board/amcc/riviera/stage-2/apm_spd_ddr.h 
rm -rf nand_spl/board/amcc/riviera/stage-2/apm_scu.c 
rm -rf nand_spl/board/amcc/riviera/stage-2/apm_sw_ddrcal.c 
rm -rf nand_spl/board/amcc/riviera/stage-2/nand_boot_apm_ufc.c 
rm -rf nand_spl/board/amcc/riviera/stage-2/ppcstring.S 
rm -rf nand_spl/board/amcc/riviera/stage-2/ufc.c 
rm -rf nand_spl/board/amcc/riviera/stage-2/ecc.h 
rm -rf nand_spl/board/amcc/riviera/stage-2/bch.c 
make
rm -rf nand_spl/board/amcc/riviera/stage-2/ppcstring.S 
make
cd nand_spl/board/amcc/riviera/stage-2/
git ls-files
git checkout ppcstring.S
ls
b
make
vi nand_spl/board/amcc/riviera/stage-2/u-boot.lds 
vi include/configs/riviera.h 
vi nand_spl/board/amcc/riviera/stage-2/u-boot.lds 
vi nand_spl/board/amcc/riviera/stage-2/config.mk 
git diff nand_spl/board/amcc/riviera/stage-2/config.mk 
git status
cp ../draft/uboot/nand_spl/board/amcc/riviera/stage-2/config.mk nand_spl/board/amcc/riviera/stage-2/
make
vi nand_spl/board/amcc/riviera/stage-2/config.mk 
ll nand_spl/board/amcc/riviera/stage-2/
ls
make
git status
make clean;
make distclean
make riviera_nand_config 
make
vi nand_spl/board/amcc/riviera/stage-2/Makefile 
ls
git diff
vi nand_spl/board/amcc/riviera/stage-2/config.mk 
make
cp ../draft/uboot/cpu/ppc4xx/apm_scu.c cpu/ppc4xx/
make clean;make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
git status
source ~/.bashrc 
git
ls
git log
git diff
git status
git ls-files
git ls-files -m
git ls-files -m | xargs git add
git status
git commit "Make ddr3 800Mhz work on Riviera"
git commit -m "Make ddr3 800Mhz work on Riviera"
git
git status
vi include/configs/riviera.h 
vi nand_spl/board/amcc/riviera/stage-2/config.mk 
vi nand_spl/board/amcc/riviera/stage-2/u-boot.lds 
git log
git show 352545f1dcc6a1802f1d14ef7b26058cb1c89d01
vi include/configs/riviera.h 
make
codesourcery 
make
make riviera_nand_config 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
vi board/amcc/riviera/riviera.c 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
vi board/amcc/riviera/riviera.c 
git status
git ls-file -m
git ls-files -m
git ls-files -m | xargs git add
git commit -m "Update state2 to 32K"
make riviera_ocm_config 
make clean;make
cp u-boot-ocm.bin /tftpboot/yvo/riviera/debug/
make riviera_nand_config 
make clean;make
git status
make clean;make
git log
ls cpu/ppc4xx/apm_scu.c 
git show cpu/ppc4xx/apm_scu.c 
git log cpu/ppc4xx/apm_scu.c 
git checkout cpu/ppc4xx/apm_scu.c 
git help checkout
git checkout cpu/ppc4xx/apm_scu.c de2a5ce827bd4d0f38163bf900fd2b61b4e01218
git status
git diff cpu/ppc4xx/apm_scu.c 
git diff 352545f1dcc6a1802f1d14ef7b26058cb1c89d01 cpu/ppc4xx/apm_scu.c
git diff de2a5ce827bd4d0f38163bf900fd2b61b4e01218 cpu/ppc4xx/apm_scu.c
git reset de2a5ce827bd4d0f38163bf900fd2b61b4e01218 cpu/ppc4xx/apm_scu.c
git status
git diff
make
cp u-boot-ocm.bin /tftpboot/yvo/riviera/debug/
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
p4 diff -f cpu/ppc4xx/apm_scu.c 
git log
git diff bfee61cdf9b425d4372f8e6bdea85e9a15394c45..de2a5ce827bd4d0f38163bf900fd2b61b4e01218
git diff bfee61cdf9b425d4372f8e6bdea85e9a15394c45..de2a5ce827bd4d0f38163bf900fd2b61b4e01218 cpu/ppc4xx/apm_scu.c
ls
git
git status
git commit -m 'Revert apm_scu.c"
git commit -m 'Revert apm_scu.c'
git log
git show 352545f1dcc6a1802f1d14ef7b26058cb1c89d01
git show --help
git show 352545f1dcc6a1802f1d14ef7b26058cb1c89d01 --pretty=oneline --abbrev-commit
vi nand_spl/board/amcc/riviera/stage-2/Makefile 
make
vi nand_spl/board/amcc/riviera/stage-2/Makefile 
make
make clean
make distclean
make
make riviera_nand_config 
make
git diff
git log --abbrev-commit --pretty=oneline
git diff faf3598..de2a5ce cpu/ppc4xx/apm_scu.c
vi cpu/ppc4xx/apm_scu.c 
make
p4 diff -f cpu/ppc4xx/apm_scu.c 
ls
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
ls
git status
git diff faf3598..de2a5ce 
vi nand_spl/nand_boot_apm_ufc.c 
gitlog
alias gitlog="git log --abbrev-commit --pretty=oneline"
gitlog 
git reset de2a5ce board/amcc/riviera/riviera.c
make
make clean
make
vi board/amcc/riviera/riviera.c 
gitlog
git diff faf3598..de2a5ce board/amcc/riviera/riviera.c
gitlog
git log
git reset de2a5ce827bd4d0f38163bf900fd2b61b4e01218 board/amcc/riviera/riviera.c
make
git status
vi board/amcc/riviera/riviera.c 
git log
git checkout de2a5ce827bd4d0f38163bf900fd2b61b4e01218 board/amcc/riviera/riviera.c
vi board/amcc/riviera/riviera.c 
make
git diff faf3598..de2a5ce 
vi include/configs/riviera.h 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
git
git log
git diff faf3598cb13a71c59a60b52a4f14ac052ea27d9e..de2a5ce827bd4d0f38163bf900fd2b61b4e01218 cpu/ppc4xx/apm_scu.c
git status
gits_upd 
git ls-file -n
git ls-files -m
git ls-files -m | xargs git add
git status
git commit -m "Revert some file to make DDR3 of riviera work at 800Mhz"
git tag v2
git tag
gitlog
git diff eae97db..de2a5ce
ls
ls include/configs/riviera_old.h 
cp include/configs/riviera.h include/configs/riviera_v2.h
ls
vi cpu/ppc4xx/Makefile 
git log
git checkout de2a5ce827bd4d0f38163bf900fd2b61b4e01218 include/configs/riviera.h
git status
vi nand_spl/board/amcc/riviera/stage-2/
make clean;make
make distclean
make riviera_nand_config 
make
cp include/configs/riviera.h include/configs/riviera_v2.h
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
vi include/configs/riviera.h 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
powerpc-apm-linux-gnu-objdump -S u-boot | less
vi include/configs/riviera.h 
make
cp u-boot-nand.bin /tftpboot/yvo/riviera/debug/ddang/
vi include/configs/riviera.h 
vi cpu/ppc4xx/apm_spd_ddr.c 
make
vi cpu/ppc4xx/apm_spd_ddr.c 
j "/AMCC/yvo/working/workspace/processor" 
p4 login
cd keelback/
cd uboot
p4 sync ...#head
vi cpu/ppc4xx/apm_spd_ddr.c 
j rn__
ls
cd uboot_udiag/
ls
cp u-boot-nand.bin /tftpboot/yvo/rnaa_86/debug/
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cgdb
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cgdb
make
cp u-boot-nand.bin /tftpboot/yvo/rnaa_86/debug/
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cdgb
cgdb
vi ../stage2.gdb 
cgdb
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
vi cpu/ppc4xx/apm_spd_ddr3.c 
ls
git log
cgdb
git checkout 9a17302fc09d214c7dbed2f01383495c02d50ec6
ls
git status
git diff cpu/ppc4xx/apm_spd_ddr3.c
ls
vi include/configs/rnaa86.h
git branch
git checkout 9a17302fc09d214c7dbed2f01383495c02d50ec6
git branch
git log
checkout 9a17302fc09d214c7dbed2f01383495c02d50ec6 cpu/ppc4xx/apm_spd_ddr3.c 
git checkout 9a17302fc09d214c7dbed2f01383495c02d50ec6 cpu/ppc4xx/apm_spd_ddr3.c 
vi include/configs/rnaa86.h
vi cpu/ppc4xx/apm_spd_ddr3.c 
vi cpu/ppc4xx/Makefile 
vi include/configs/rnaa86.h 
make clean;make
cp u-boot-nand.bin /tftpboot/yvo/rnaa_86/debug/
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cgdb 
codesourcery 
make
cp u-boot-nand.bin /tftpboot/yvo/rnaa_86/debug/
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cgdb
;s
codesourcery 
make clean
make
cp u-boot-nand.bin /tftpboot/yvo/rnaa_86/debug/
powerpc-apm-linux-gnu-objdump -S nand_spl/board/amcc/rnaa86/stage-2/u-boot-spl | less
cgdb
ls
file u-boot.bin 
file u-boot
ls
vi cpu/ppc4xx/apm_spd_ddr3.c 
ls
vi cpu/ppc4xx/apm_spd_ddr.c 
j ref__
cd keelback_rd/
ls
cd uboot
vi include/configs/riviera.h 
ls
make clean
exit
j ref__
ls
cd rnaa-86/
cd uboot_udiag/
vi cpu/ppc4xx/apm_spd_ddr3.c 
exit
j "/AMCC/yvo/working/workspace/processor" 
ls
cd keelback/
ls
cd uboot
ls
vi nand_spl/board/amcc/cascade/stage-2/Makefile 
cd ..
ls
cd ..
ls
exit
ww\
ww
ww
j rn__
ls
cd ../
cd keelback_rd/
ls
cd uboot
vi cpu/ppc4xx/apm_spd_ddr.c 
vi board/amcc/riviera/riviera.c 
exit
j kee__
cd uboot
cd ../linux/
vi arch/powerpc/boot/dts/malibu_lite.dts 
exit
ls
j rn__
ls
cd uDiag/
ls
code
codesourcery 
cd uDiag2-rnaa86/
ls
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
codesourcery 
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
make
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
make
cp uDiag-rnaa86-nand.bin /tftpboot/yvo/rnaa_86/
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
grep sdram_memsize -rw .
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
rm -rf arch/powerpc/cpu/ppc4xx/.apm_spd_ddr.c.swp 
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
vi include/configs/rnaa86_
vi include/configs/rnaa86_nand.h 
make
cp uDiag-rnaa86-nand.bin /tftpboot/yvo/rnaa_86/uDiag-rnaa86-nand_1050.bin 
make clean
make distclean
make rnaa86_ddr_nand_
make rnaa86_ddr_nand_config 
make
cp uDiag-rnaa86-ddr-nand.bin /tftpboot/yvo/rnaa_86/uDiag-rnaa86-ddr-nand_1050.bin 
vi include/configs/rnaa86_nand.h 
vi arch/powerpc/cpu/ppc4xx/apm_spd_ddr.c 
cd ../
ls
cd ..
ls
cd uboot_udiag/
vi cpu/ppc4xx/apm_spd_ddr3.c 
ww
exit
j ref
cd keelback_rd/
cd uboot
vi board/amcc/malibu_lite/malibu_lite.c 
exit
ls
cd /tftpboot/yvo/rnaa_86/bdi/
vi rnaa_ocm_fam.cfg 
vi rnaa_ocm_fam.cfg 
diff rnaa_ocm_fam.cfg ../../riviera/bdi/riviera_nand.cfg 
exit
