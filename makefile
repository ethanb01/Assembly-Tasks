all:
	nasm -f elf asmtask2.nasm -o myelf.o
	gcc -m32 -d tas2.c myelf.o -o run
	

.PHONY: clean
clean:
	rm -rf *.o run
