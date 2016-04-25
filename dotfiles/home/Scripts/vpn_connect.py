#!/usr/bin/python

import os

serverpath = "/etc/openvpn"
opendir = os.listdir( serverpath )
command_exec = "sudo pia -a; sudo openvpn --config /etc/openvpn/"
kill_exec = "sudo killall openvpn python2"
while True:
    try:
        print("Connecting to VPN")
        # Asks for the server config
        server = raw_input("Enter VPN server to connect (CONFIG): ")
        # Prints out the conf dir if no input
        if ( not server or server == "help" ):
            for file in opendir:
                print (file)
        # Default connection
        elif server == "def":
            server = "US_West.conf"
            os.system( command_exec + server + " &")
            os.system("clear")
            break
        # Forces a connection
        # Will fail if not real server
        else:
            os.system( command_exec + server + " &")
            os.system("clear")
            break
    except:
        # Someone will break it
        print "error"
