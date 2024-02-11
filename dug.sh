#!/bin/bash

# Version: 1.0.7
# Date: 2024-01-18
# Author: Adam Vallee
# Source: https://github.com/adamvallee/dug

# Convert arguments to lowercase
arg1=$(echo "$1" | tr '[:upper:]' '[:lower:]')
arg2=$(echo "$2" | tr '[:upper:]' '[:lower:]')
arg3=$(echo "$3" | tr '[:upper:]' '[:lower:]')

# Check if 's' was passed as an argument
if [ "$arg1" = "s" ]; then
    short_option="+short"
    shift
else
    short_option=""
fi

# Check if 'cf' was passed as an argument
if [ "$arg1" = "cf" ]; then
    server="@1.1.1.1"
    shift
elif [ "$arg1" = "g" ]; then
    server="@8.8.8.8"
    shift
else
    server=""
fi

# Check if 'mx' was passed as an argument
if [ "$arg1" = "mx" ]; then
    record_type="MX"
    shift
else
    record_type=""
fi

# Check if a domain name was passed as an argument
if [ -z "$1" ]; then
    echo "Please enter the domain name:"
    read domain_name
else
    domain_name=$1
fi

# Run the dig command with the possibly empty short_option, server, and record_type
dig $short_option $server $domain_name $record_type