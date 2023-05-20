#!/bin/dash


# testing subset 1 - all commands with $

# TEST 5.1 #
reference=$(seq 20 43 | 2041 speed '$q')
program=$(seq 20 43 | ./speed.pl '$q')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 5.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 5.1 FAILED\033[0m\n"
fi


# TEST 5.2 #
reference=$(seq 20 70 | 2041 speed '$p')
program=$(seq 20 70 | ./speed.pl '$p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 5.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 5.2 FAILED\033[0m\n"
fi


# TEST 5.3 #
reference=$(seq 20 70 | 2041 speed '$d')
program=$(seq 20 70 | ./speed.pl '$d')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 5.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 5.3 FAILED\033[0m\n"
fi


# TEST 5.4 #
reference=$(seq 1 100 | 2041 speed '$s/[1-9]/haha/')
program=$(seq 1 100 | ./speed.pl '$s/[1-9]/haha/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 5.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 5.4 FAILED\033[0m\n"
fi



# TEST 5.5 #
reference=$(seq 20 70 | 2041 speed -n '$p')
program=$(seq 20 70 | ./speed.pl -n '$p')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 5.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 5.5 FAILED\033[0m\n"
fi