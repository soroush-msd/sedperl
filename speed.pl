#!/usr/bin/perl -w

# implemented subset0 and $command from subset 1

# storing the number of arguments 
$arg_num = @ARGV;
$nFlag = 0;

# if no argument is provided, print error message and exit 
if(!$ARGV[0]){
    die "usage: $0 [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n";
}

# else if the number of argument is 1, only the command is provided
else{
    if($arg_num == 1){
        $arg = $ARGV[0];
    }

    # else -n flag is provided
    elsif($arg_num == 2){
        if($ARGV[0] eq '-n'){
            $nFlag = 1;
            $arg = $ARGV[1];
        }
    }
}


# function to process the q command
sub process_q {

    # split the argument to get the part realted to regex address or 
    # line number
    my @q_arg = split(/q$/, $arg);

    # if it is a regex address
    if($arg =~ /\//){

        #split based on /
        my @regex = split('/', $q_arg[0]);
        while(my $line = <STDIN>){

            # if nflag is flase, search for the maching line and print
            if($nFlag != 1){
                if($line !~ /$regex[1]/g){
                    print "$line";
                }
                else{
                    print "$line";
                    exit 0;
                }
            }
        }
    }

    # if the command starts with $
    elsif($arg eq '$q') {
        my $counter = 0;
        my $prev = 0;

        # while reading the lines, store them into an array
        # to keep track of them 
        while(my $line = <STDIN>){
            push(@last_quit, $line);

            # if it's nflag is false and its the first line 
            # add to counter and next
            if($nFlag != 1){
                if($counter == 0){
                    $counter++;
                    next;
                }
                # else print the previous entered line
                # and print the last line of its eof
                else{
                    print "$last_quit[$prev]";
                    if (eof){
                        print "$last_quit[$counter]";
                    }
                }
            }
            $prev = $counter;
            $counter++;
        }
    }
    
    # if the command is q only, print first line and exit
    elsif($arg eq 'q') {
        while(my $line = <STDIN>){
            if($nFlag != 1){
                print "$line";
                exit 0;
            }
        }
    }

    # if the line number is entered
    else{

        # store the line number and do error checking on the boundries of the number
        my $line_number = $q_arg[0];
        die "usage: $0 [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n" if ($line_number < 0);
        die "$0: command line: invalid command" if ($line_number == 0);
        my $lineCount = 1;
        while(my $line = <STDIN>){
            if($nFlag != 1){

                # if the line count is less than or equal to the line num
                # print the line
                if($lineCount <= $line_number){
                    $lineCount++;
                    print "$line";

                    # if it gets larger, exit
                    if($lineCount > $line_number){
                        exit 0;
                    }
                }
            }
        }
    }

}

# function to process the p command
sub process_p {

    # split the argument to get the part realted to regex address or 
    # line number
    my @p_arg = split(/p$/, $arg);

    # if it is a regex address
    if($arg =~ /\//){

        # split the arg based on / and store them parts into regex array
        my @regex = split('/', $p_arg[0]);
        while(my $line = <STDIN>){

            #if the line matches the regex, print it
            if($line =~ /$regex[1]/g){
                print "$line";
            }
            #if nflag is flase also print the line
            if($nFlag != 1){
                print "$line";
            }
        }
    }

    # if the command is $p
    elsif($arg eq '$p') {
        my $counter = 0;
        my $prev = 0;

        # loop through the lines and store them into an array to
        # keep track of the previous entered line
        while(my $line = <STDIN>){
            push(@last_print, $line);

            # if nflag is false, for the first line, add to the counter
            if($nFlag != 1){
                if($counter == 0){
                    $counter++;
                    next;
                }

                # if not the first line, print the previous entered line
                # if eof, print the current line
                else{
                    print "$last_print[$prev]";
                    if (eof){
                        print "$last_print[$counter]";
                    }
                }
            }
            print "$last_print[$counter]" if(eof);
            $prev = $counter;
            $counter++;
        }
    }

    # if the command is p
    elsif($arg eq 'p') {
        while(my $line = <STDIN>){

            # if nflag is true, print only once
            if($nFlag == 1){
                print "$line";
            }

            # else print the line twice
            else{
                print "$line";
                print "$line";
            }
        }
    }

    # if the line number is requested in command line
    else{

        # strore it and do the error checkings 
        my $line_number = $p_arg[0];
        die "usage: $0 [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n" if ($line_number < 0);
        die "$0: command line: invalid command" if ($line_number == 0);
        my $lineCount = 1;

        # if we have reached the requested line, print the line
        while(my $line = <STDIN>){
            if($lineCount == $line_number){
                print "$line";
            }

            # if nflag is false, print all lines
            if($nFlag != 1){
                print "$line";
                
            }
            $lineCount++; 
        }
    }

}

# function to process the d command
sub process_d {

    # split based on d and store the result into array
    my @d_arg = split(/d$/, $arg);

    # if it is an address, split based on /
    if($arg =~ /\//){
        my @regex = split('/', $d_arg[0]);

        # print the line if it matches the regex and nflag is also false
        while(my $line = <STDIN>){
            if($line !~ /$regex[1]/g && $nFlag != 1){
                print "$line";
            }
        }
    }

    # if the command is $d
    elsif($arg eq '$d') {
        my $counter = 0;
        my $prev = 0;

        # store the previous entered lines into an array
        while(my $line = <STDIN>){
            push(@last_delete, $line);

            # add to the counter if the first line and nflag !=1
            if($nFlag != 1){
                if($counter == 0){
                    $counter++;
                    next;
                }

                # print the previous lines if not the first line
                else{
                    print "$last_delete[$prev]";
                }
            }
            $prev = $counter;
            $counter++;
        }
    }

    # if the command is d only, do nothing and skip
    elsif($arg eq 'd') {
        while(my $line = <STDIN>){
            next;
        }
    }

    # if the line number is requested, store into a scalar and do thr
    # error checkings
    else{
        my $line_number = $d_arg[0];
        die "usage: $0 [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n" if ($line_number < 0);
        die "$0: command line: invalid command" if ($line_number == 0);
        my $lineCount = 1;

        # read the lines and print the ones which are not equal to the
        # line number requested
        while(my $line = <STDIN>){
            if($lineCount != $line_number && $nFlag != 1){
                print "$line";
            }
            $lineCount++;
        }
    }

}

# simple function used only for substitution
sub process_s {

    # store the arguments into the relecant variables
    my($regex_parts, $pattern, $replacement, $line) = @_;

    # if the different parts provided for regex address for substitution
    # is equal to 4, it means that g is provided
    if($regex_parts == 4){
        $line =~ s/$pattern/$replacement/g;
    }

    # if equal to 3, g is not provided
    elsif($regex_parts == 3){
        $line =~ s/$pattern/$replacement/;
    }

    # if equal to 2, no replacement for pattern, only removing the pattern
    elsif($regex_parts == 2){
        $line =~ s/$pattern//;
    }

    # print the line if nflag is not true
    print "$line" if($nFlag != 1);

}

# this function processes the regex addresses and calls the above function
# to carry out the substitution 
sub process_s_2 {

    # storing the argument into pattern (ptrn) variable
    my ($ptrn) = @_;

    #pattern starts with s, split based on ^s and store them into an array
    if($ptrn =~ /^s/){
        my @s_arg = split(/^s/, $ptrn);

        # if the pattern matched with /
        if($ptrn =~ /\//){
            if($ptrn =~ /s\/\/\//){
                die "$0: command line: invalid command\n";
            }

            #split based on / to get different parts of the regex subsitution
            my @regex = split('/', $s_arg[1]);
            my $regex_parts = @regex;
            my $pattern = $regex[1];
            my $replacement = $regex[2] if ($regex_parts > 2);

            # read the lines and call the substitution function to carry out the
            # substitution
            while($line = <STDIN>){
                process_s($regex_parts,$pattern,$replacement,$line);
            }
        }

        # if the command is equal to s only, invalid command
        elsif($ptrn eq 's') {
            die "$0: command line: invalid command\n";
        }

        else{
            die "$0: command line: invalid command\n";
        }
    }

    # if $s is requested split and store
    elsif($ptrn =~ /^\$s/) {
        my @s_arg = split(/\$s/, $ptrn);
        if($ptrn =~ /\//){
            if($ptrn =~ /s\/\/\//){
                die "$0: command line: invalid command\n";
            }

            # storing the different parts of the regex again
            my @regex = split('/', $s_arg[1]);
            my $regex_parts = @regex;
            my $pattern = $regex[1];
            my $replacement = $regex[2] if ($regex_parts > 2);
            my $counter = 0;
            my $prev = 0;

            # read the lines, store them into an array to keep track 
            # previously enetred lines
            while(my $line = <STDIN>){
                push(@last_print, $line);

                #if nflag is false, increment the counter if first line
                if($nFlag != 1){
                    if($counter == 0){
                        $counter++;
                        next;
                    }

                    # if not the first line, print the previously
                    # enered lines
                    else{
                        print "$last_print[$prev]";

                        # if eof, call the line to carry out the substitution
                        if (eof){
                            process_s($regex_parts,$pattern,$replacement,$line);
                        }
                    }
                }
                $prev = $counter;
                $counter++;
            }
        }
        elsif($ptrn eq 's') {
            die "$0: command line: invalid command\n";
        }

        else{
            die "$0: command line: invalid command\n";
        }
    }

    # if addresses are given to the command
    else{

        # store different parts of the address by splitting
        my @s_arg = split(/s/, $ptrn);
        my @regex = split('/', $s_arg[1]);
        my @address = split('/', $s_arg[0]);
        my $regex_parts = @regex;
        my $pattern = $regex[1];
        my $replacement = $regex[2] if ($regex_parts > 2);

        # if the address is a line address, read the lines
        # if match the address, call the substitution function
        if($s_arg[0] =~ /\//){
            my $reg_addr = $address[1];
            while(my $line = <STDIN>){
                if($line =~ /$reg_addr/g){
                    process_s($regex_parts,$pattern,$replacement,$line);
                }

                # else just print if nflag is false
                else{
                    print "$line" if($nFlag != 1);
                }
            }
        }

        # if line number is requested, store and do the error checkings
        else {
            my $lineCount = 1;
            my $line_number = $address[0];
            die "usage: $0 [-i] [-n] [-f <script-file> | <sed-command>] [<files>...]\n" if ($line_number < 0);
            die "$0: command line: invalid command" if ($line_number == 0);

            # if not the line that is requested, just print it
            while(my $line = <STDIN>){
                if($lineCount != $line_number){
                    print "$line" if($nFlag != 1);
                }

                # if the line number is reached, call the substituion
                # function to carry out the substitution
                else{
                    process_s($regex_parts,$pattern,$replacement,$line);
                }
                $lineCount++;
            }   
        }
    }
}


# if statements to process which command is requested in the command line
if($arg =~ /q$/) {
    process_q();
}
elsif($arg =~ /p$/){
    process_p();
}
elsif($arg =~ /d$/){
    process_d();
}
elsif($arg =~ /^s/ || $arg =~ /^\/.*\/s\/.*/ ||  $arg =~ /^\d+s\/.*/ || $arg =~ /^\$s/){
    my $ptrn = $arg;
    process_s_2($ptrn);
}



