# dug
 A simple bash script that uses dig




The script will accept arguments in any case (e.g., ./dug.sh S CF mx EXAMPLE.COM, or ./dug.sh s cf MX EXAMPLE.COM).

C

 run the script with an 'MX' argument to add 'MX' to the end of the dig command (e.g., ./filename s CF MX example.com). If you run the script without the 'MX' argument, it will run dig without specifying a record type.


Get It

Download using the following command:

wget https://raw.githubusercontent.com/adamvallee/dug/main/dug.sh && sudo chmod +x dug.sh

