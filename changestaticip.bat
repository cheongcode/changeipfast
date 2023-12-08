@echo off
setlocal

:: Set the base of the IP address which you wish to change

set IPBase=172.16.25.

:: Load the last octet from the text file, if it exists

if exist lastip.txt (
    set /p LastOctet=<lastip.txt
) else (
    set LastOctet=13
)

:: To increment the last octet by 1

set /a LastOctet=LastOctet + 1

:: If the last octet is greater than 253, reset it to 10

if %LastOctet% GTR 253 set LastOctet=10

:: Save the new last octet back to the text file

>lastip.txt echo %LastOctet%

:: Combine the base IP with the new last octet to form the full IP

set FullIP=%IPBase%%LastOctet%

:: Apply the new IP configuration along with the subnet mask and gateway

netsh interface ipv4 set address name="Ethernet 2" static %FullIP% 255.255.255.0 172.16.25.254

:: Show the new IP for confirmation

echo New static IP address has been set to: %FullIP%

:: Pause the script so you can see the output

echo Script Complete
pause