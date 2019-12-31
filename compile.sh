lex comm.l
gcc lex.yy.c -ll
./a.out
lex p1.l
yacc -d p1.y
gcc y.tab.c -ll -ly
./a.out<out.c
