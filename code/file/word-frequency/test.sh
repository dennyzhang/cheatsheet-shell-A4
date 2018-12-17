#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
##   https://leetcode.com/problems/word-frequency/description/
## https://cheatsheet.dennyzhang.com/cheatsheet-shell-A4
## --
## Created : <2017-10-17>
## Updated: Time-stamp: <2018-12-16 22:26:56>
##-------------------------------------------------------------------
set -e

# shellcheck disable=1117
uniq_words=$(sed -e "s/ /\\n/g" words.txt | sed -e "s/\\n/\n/g" | sort | grep -v '^$' | uniq)
output=""

for uniq_word in $uniq_words; do
    #echo "$uniq_word"
    # shellcheck disable=1117
    count=$(grep "$uniq_word" words.txt | sed -e "s/ /\n/g" | grep -c "^${uniq_word}"'$')
    output="${output}\\n${uniq_word} ${count}"
done

echo -e "$output" | grep -v '^$' | sort -n -k 2 -r
