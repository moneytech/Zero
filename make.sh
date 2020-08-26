# select a resolution supported by the BIOS
WIDTH=800
HEIGHT=600

nasm -f bin kernel.asm		-o build/kernel
KERNEL_SIZE=`wc -c < build/kernel`

nasm -f bin zero.asm		-o build/zero		-dKERNEL_FILE_SIZE_bytes=${KERNEL_SIZE} -dSELECTED_VIDEO_WIDTH_pixel=${WIDTH} -dSELECTED_VIDEO_HEIGHT_pixel=${HEIGHT}
ZERO_SIZE=`wc -c < build/zero`

nasm -f bin bootsector.asm	-o build/bootsector	-dZERO_FILE_SIZE_bytes=${ZERO_SIZE}

nasm -f bin disk.asm		-o build/disk.raw
