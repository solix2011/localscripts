add-symbol-file nand_spl/board/amcc/rnaa86/stage-1/u-boot-spl 0xfffff000
b nand_boot_relocate
target remote 10.38.14.27:2001
