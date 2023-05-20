#!/bin/dash


# testing subset 0 - all commands with -n

# TEST 4.1 #
reference=$(seq 20 43 | 2041 speed -n '5q')
program=$(seq 20 43 | ./speed.pl -n '5q')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.1 FAILED\033[0m\n"
fi

# TEST 4.2 #
reference=$(seq 20 70 | 2041 speed -n '43p')
program=$(seq 20 70 | ./speed.pl -n '43p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.2 FAILED\033[0m\n"
fi

# TEST 4.3 #
reference=$(seq 20 70 | 2041 speed -n '/5{2}/p')
program=$(seq 20 70 | ./speed.pl -n '/5{2}/p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.3 FAILED\033[0m\n"
fi


# TEST 4.4 #
reference=$(seq 20 70 | 2041 speed -n '/.8$/p')
program=$(seq 20 70 | ./speed.pl -n '/.8$/p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.4 FAILED\033[0m\n"
fi


# TEST 4.5 #
reference=$(seq 20 70 | 2041 speed -n '43d')
program=$(seq 20 70 | ./speed.pl -n '43d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.5 FAILED\033[0m\n"
fi


# TEST 4.6 #
reference=$(seq 1 100 | 2041 speed -n 's/[1-9]/haha/')
program=$(seq 1 100 | ./speed.pl -n 's/[1-9]/haha/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.6 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.6 FAILED\033[0m\n"
fi


# TEST 3.6 #
reference=$(seq 200 400 | 2041 speed -n '/^.*00$/s/00/**/')
program=$(seq 200 400 | ./speed.pl -n '/^.*00$/s/00/**/')

if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 4.7 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 4.7 FAILED\033[0m\n"
fi