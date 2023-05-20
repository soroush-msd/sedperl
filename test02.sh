#!/bin/dash


# testing subset 0 - command d

# TEST 2.1 #
reference=$(seq 20 70 | 2041 speed '43d')
program=$(seq 20 70 | ./speed.pl '43d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 2.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 2.1 FAILED\033[0m\n"
fi


# TEST 2.2 #
reference=$(seq 1 50 | 2041 speed 'd')
program=$(seq 1 50 | ./speed.pl 'd')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 2.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 2.2 FAILED\033[0m\n"
fi


# TEST 2.3 #
reference=$(seq 1000 3000 | 2041 speed '/^2/d')
program=$(seq 1000 3000 | ./speed.pl '/^2/d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 2.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 2.3 FAILED\033[0m\n"
fi


# TEST 2.4 #
reference=$(seq 100 500 | 2041 speed '/[0-9]{3}/d')
program=$(seq 100 500 | ./speed.pl '/[0-9]{3}/d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 2.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 2.4 FAILED\033[0m\n"
fi


# TEST 2.5 #
reference=$(seq 100 500 | 2041 speed '700d')
program=$(seq 100 500 | ./speed.pl '700d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 2.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 2.5 FAILED\033[0m\n"
fi

