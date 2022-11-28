#!/bin/bash
#-f to force delete files
#-d recursively check directories in repo and not just the leave the commad
#-n perform a dry-run first, meaning it will identify files but not remove
TO_REMOVE=`git clean -f -d -n`;

#if the command's execution doesn't return 'null'
if [[ -n "$TO_REMOVE" ]]; then
    echo "Cleaning . . .";
#use printf to execute the expression that `TO_REMOVE` variable holds
    printf "\n$TO_REMOVE\n\n";
    echo "Proceed?";

    #use `Select` command to prompt a list of options to be displayed for picking and store in `result`
    select result in Yes No; do
    #if we say "yes" in the prompt...
    if [[ "$result" == "Yes"]]; then 
    echo "Cleaning in progress . . .";
    echo "";
    #execute `git clean -f -d`
    git clean -f -d;
    echo "";
    echo "All files and directories removed";
    fi
    break;
    done;
else
    echo "Everything is clean";
fi;