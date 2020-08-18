nasm -f elf64 numbers.asm 
ld -s -o numbers numbers.o -lc
./numbers
