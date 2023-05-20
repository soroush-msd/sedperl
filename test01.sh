#!/bin/dash


# testing subset 0 - command p

# TEST 1.1 #
reference=$(seq 20 70 | 2041 speed '43p')
program=$(seq 20 70 | ./speed.pl '43p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 1.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 1.1 FAILED\033[0m\n"
fi


# TEST 1.2 #
reference=$(seq 20 70 | 2041 speed '80p')
program=$(seq 20 70 | ./speed.pl '80p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 1.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 1.2 FAILED\033[0m\n"
fi


# TEST 1.3 #
reference=$(seq 20 70 | 2041 speed 'p')
program=$(seq 20 70 | ./speed.pl 'p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 1.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 1.3 FAILED\033[0m\n"
fi


# TEST 1.4 #
reference=$(seq 20 70 | 2041 speed '/5{2}/p')
program=$(seq 20 70 | ./speed.pl '/5{2}/p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 1.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 1.4 FAILED\033[0m\n"
fi

# TEST 1.5 #
reference=$(seq 20 70 | 2041 speed '/.8$/p')
program=$(seq 20 70 | ./speed.pl '/.8$/p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 1.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 1.5 FAILED\033[0m\n"
fi