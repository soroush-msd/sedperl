#!/bin/dash


# testing subset 0 - command s

# TEST 3.1 #
reference=$(seq 1 100 | 2041 speed 's///')
program=$(seq 1 100 | ./speed.pl 's///')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.1 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.1 FAILED\033[0m\n"
fi

# TEST 3.2 #
reference=$(seq 1 100 | 2041 speed 's/[1-9]/haha/')
program=$(seq 1 100 | ./speed.pl 's/[1-9]/haha/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.2 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.2 FAILED\033[0m\n"
fi

# TEST 3.3 #
reference=$(echo i hate comp2041 | 2041 speed 's/hate/love/')
program=$(echo i hate comp2041 | ./speed.pl 's/hate/love/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.3 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.3 FAILED\033[0m\n"
fi


# TEST 3.4 #
reference=$(echo i hate comp2041 | 2041 speed 's/hate/love/')
program=$(echo i hate comp2041 | ./speed.pl 's/hate/love/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.4 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.4 FAILED\033[0m\n"
fi


# TEST 3.5 #
reference=$(seq 200 400 | 2041 speed '101s/00/hundred/')
program=$(seq 200 400 | ./speed.pl '101s/00/hundred/')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.5 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.5 FAILED\033[0m\n"
fi


# TEST 3.6 #
reference=$(seq 200 400 | 2041 speed '/^.*00$/s/00/**/')
program=$(seq 200 400 | ./speed.pl '/^.*00$/s/00/**/')

if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.6 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.6 FAILED\033[0m\n"
fi


# TEST 3.7 #
reference=$(echo will will will | 2041 speed 's/w/b/g')
program=$(echo will will will| ./speed.pl 's/w/b/g')


if test "$reference" = "$program"
then
    printf '%b' "\033[32;1mTEST 3.7 PASSED\033[0m\n"
  
else
    printf '%b' "\033[31;1mTEST 3.7 FAILED\033[0m\n"
fi



