# IPv4 Static IP Address Increment Script

## A Tragic Backstory
I developed this script as a solution for a unique challenge we encountered in one of my workplaces. We were dealing with a peculiar issue with an application. Each time we logged out, the app would incorrectly register our IP address as still being active, preventing us from logging back in. To complicate matters, our laptops couldn't be connected to the internet due to security protocols. This might seem like a minor inconvenience, but for a team not deeply familiar with technology, it became a significant daily hurdle. It was particularly challenging for them to change their IP addresses manually, and teaching them how to change IP addresses over and over again doesn't seem like a feasible solution. So, I decided to step in and create a simple script to make this process much easier and more efficient for everyone involved.

## Description
This batch script is designed for Windows users who need to frequently change their IPv4 static IP address within a specific range. It automatically increments the last octet of a static IPv4 address for a specified network interface. Starting from `172.16.25.14`, the script increments the last octet each time it's run and resets to `172.16.25.10` upon reaching `172.16.25.253`. I'm not sure why and where you would be using this script but hey I hope this is useful for you.

## Features
- Sets a static IPv4 address with automated incrementation of the last octet.
- Resets the last octet to a predefined lower limit after reaching a specified upper limit.
- Maintains continuity by storing the last used octet in a text file between runs.

## Prerequisites
- Windows Operating System.
- Administrative privileges for changing network settings.

## Usage
1. **Initial Setup**: 
   - Place the `ip_increment.bat` and `lastip.txt` files in the same directory.
2. **Modify the Script (Optional)**: 
   - Edit the `ip_increment.bat` file to change the base IP address (`IPBase`) or network interface name (`Ethernet 2`) as per your network configuration.
3. **Running the Script**:
   - Right-click on `ip_increment.bat` and select 'Run as administrator'.
   - The script will apply a new static IPv4 address, display it, and pause for confirmation.

## File Description
- `ip_increment.bat`: The batch file containing the script for incrementing the IP address.
- `lastip.txt`: Stores the last octet used, facilitating continuity between script runs.

## Important Notes
- The network interface name in the script must match your actual network interface.
- Administrative privileges are required to modify network settings.
- Ensure the IP range set by the script does not conflict with other devices on your network.

## Disclaimer
This script is provided 'as is' for convenience and should be used with caution, particularly in network environments. The author bears no responsibility for network disruptions or conflicts arising from its use.

## Author
cheongcode
