#!/bin/dash


# testing subset 0 - command q

# TEST 0.1 #
reference=$(seq 20 43 | 2041 speed '5q')
program=$(seq 20 43 | ./speed.pl '5q')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.1 FAILED\033[0m\n"
fi


# TEST 0.2 #
reference=$(seq 1 100 | 2041 speed '200q')
program=$(seq 1 100 | ./speed.pl '200q')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.2 FAILED\033[0m\n"
fi


# TEST 0.3 #
reference=$(seq 1 100 | 2041 speed '/0/q')
program=$(seq 1 100 | ./speed.pl '/0/q')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.3 FAILED\033[0m\n"
fi



# TEST 0.4 #
reference=$(seq 1 100 | 2041 speed '/5{2}/q')
program=$(seq 1 100 | ./speed.pl '/5{2}/q')

if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.4 FAILED\033[0m\n"
fi



# TEST 0.5 #
reference=$(seq 400 500 | 2041 speed '/^.4.$/q')
program=$(seq 400 500 | ./speed.pl '/^.4.$/q')

if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.5 FAILED\033[0m\n"
fi


# TEST 0.6 #
reference=$(seq 400 500 | 2041 speed 'q')
program=$(seq 400 500 | ./speed.pl 'q')

if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 0.6 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 0.6 FAILED\033[0m\n"
fi





    
