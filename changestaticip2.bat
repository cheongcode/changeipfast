@echo off
setlocal enabledelayedexpansion

:: Initialize the IP configuration
echo [+] Initializing IP Configuration...
set IPBase=172.16.25.

:: Load the last octet from the text file
if exist lastip.txt (
    set /p LastOctet=<lastip.txt
    echo [+] Last IP Octet Loaded: !LastOctet!
) else (
    set LastOctet=13
    echo [!] No previous configuration found. Starting fresh.
)

:: Increment the last octet by 1 with a cool countdown
echo [+] Preparing to increment IP...
for /l %%x in (3, -1, 1) do (
    echo ... %%x
    ping localhost -n 2 >nul
)

set /a LastOctet=LastOctet + 1
if !LastOctet! GTR 253 set LastOctet=10

:: Save the new last octet
>lastip.txt echo !LastOctet!
echo [+] New IP Octet Saved: !LastOctet!

:: Apply the new IP configuration
echo [+] Applying new IP Configuration...
set FullIP=!IPBase!!LastOctet!
netsh interface ipv4 set address name="Ethernet 2" static !FullIP! 255.255.255.0 172.16.22.254

:: Completion message
echo [+] New IP Address Successfully Set: !FullIP!
echo [+] Process Complete! 
pause
