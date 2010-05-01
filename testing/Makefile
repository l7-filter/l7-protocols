all:
	gcc -O2 -o randchars randchars.c
	gcc -O2 -o randprintable randprintable.c
	gcc -w -o test_speed-henry test_speed-henry.c
	gcc -w -o test_speed-gnu   test_speed-gnu.c
	gcc -w -O2 -o match-henry match-henry.c
	gcc -w -O2 -o match-gnu   match-gnu.c

clean:
	rm -f randprintable randchars test_speed-henry test_speed-gnu match-henry match-gnu
