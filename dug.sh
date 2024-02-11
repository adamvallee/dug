#!/bin/bash

# Version: 1.0.13
# Date: 2024-01-23
# Author: Adam Vallee
# Source: https://github.com/adamvallee/dug

short_option=""
server=""
record_type=""

# Process each argument
while (( "$#" )); do
  arg=$(echo "$1" | tr '[:upper:]' '[:lower:]')  # Convert argument to lowercase
  case "$arg" in
    "s")
      short_option="+short"
      ;;
    "cf")
      server="@1.1.1.1"
      ;;
    "g")
      server="@8.8.8.8"
      ;;
    "mx")
      record_type="MX"
      ;;
    "txt")
      record_type="TXT"
      ;;
    "help")
      echo "Usage: ./dug.sh [s] [cf|g] [mx|txt] domain_name"
      echo "Options:"
      echo "  s: Use +short option with dig"
      echo "  cf: Use @1.1.1.1 server with dig"
      echo "  g: Use @8.8.8.8 server with dig"
      echo "  mx: Use MX record type with dig"
      echo "  txt: Use TXT record type with dig"
      echo "  domain_name: The domain to query"
      exit 0
      ;;
    *)
      # If the argument is not one of the options, assume it is the domain name
      domain_name="$1"
      ;;
  esac
  shift  # Move on to the next argument
done

# If no domain name was passed as an argument, ask for one
if [ -z "$domain_name" ]; then
    echo "Please enter the domain name:"
    read domain_name
fi

# Run the dig command with the possibly empty short_option, server, and record_type
dig $short_option $server $domain_name $record_type