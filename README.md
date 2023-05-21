# sedperl
Interpreting basic functionalities of the famous stream editor Sed in Perl

The commands implemented are `'q'`, `'p'`, `'d'`, `'s'`, and `'$'`:

```
$ seq 20 43 | ./speed.pl '5q'
20
21
22
23
24

$ seq 1 100 | ./speed.pl '/5{2}/q'
1
2
3
...
55

$ seq 400 500 | ./speed.pl '/^.4.$/q'
400
401
402
...
440
```
