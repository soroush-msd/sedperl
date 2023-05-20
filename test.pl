#!/usr/bin/perl -w

$pattern = 's/1/2/g';


while($line = <STDIN>) {
    eval "$line =~ $pattern";
    print "$line";
}