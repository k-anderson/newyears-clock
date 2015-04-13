
all:
	sdcc --use-non-free -p16f690 -o out newyears.c -I/usr/share/sdcc/non-free/include/pic14 -I/usr/share/sdcc/non-free/lib/pic14 -I/usr/share/gputils/lkr/ -mpic14 --debug

clean:
	rm -f out*

load: 
	pk2cmd -PPIC16F690 -M -Fout.hex -Y
	
start:
	pk2cmd -PPIC16F690 -T

stop:
	pk2cmd -PPIC16F690 -R
