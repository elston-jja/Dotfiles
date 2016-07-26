#!/usr/bin/python

'''Easy Connection To A VPN'''
import os
import readline
import time

serverpath = "/etc/openvpn"
opendir = os.listdir( serverpath )
command_exec = "sudo pia -a; sudo openvpn --config /etc/openvpn/"

class MyCompleter(object):  # Custom completer

    def __init__(self, options):
        self.options = sorted(options)

    def complete(self, text, state):
        if state == 0:  # on first trigger, build possible matches
            if text:  # cache matches (entries that start with entered text)
                self.matches = [s for s in self.options 
                                    if s and s.startswith(text)]
            else:  # no text entered, all matches possible
                self.matches = self.options[:]

        # return match indexed by state
        try: 
            return self.matches[state]
        except IndexError:
            return None
def help_statement():
    print"    FUNCTION    |     USE"
    print"                |"
    print"Get server list |    <tab><tab>"
    print"Auto-Complete   |    PARTIAL/SERVER/NAME<tab>"
        
completer = MyCompleter(opendir)
readline.set_completer(completer.complete)
readline.parse_and_bind('tab: complete')

while True:
    try:
        # Asks for the server config
        server = raw_input("Enter VPN server to connect (CONFIG): ")
        # Prints out the conf dir if no input
        if (not server):
            print "\033[31m" + "Enter a server please\n\033[0m\033[92mFor more information please type in 'help'" + "\033[0m"
        elif server == "help":
            help_statement()
        # Default connection
        elif server == "def":
            print("Connecting to default: \033[92m US_WEST \033[0m")
            server = "US_West.conf"
            os.system( command_exec + server + " &")
            time.sleep(5.0)
            os.system("clear")
            break
        elif (server not in opendir):
            print ("Server Config Does Not Exist")
            check = raw_input("Do you want to try and reconnect (y/N): ")
            accept_ans = ['Y','yes','y','YES','fsck']
            if check in accept_ans:
                print("Retrying connection to a server")
            else:
                print("Exiting...")
                break
        # Forces a connection
        # Will fail if not real server
        else:
            print("Connecting to Server: \033[92m" + server + "\033[0m")
            os.system( command_exec + server + " &")
            time.sleep(5.0)
            os.system("clear")
            break
    except ValueError:
        # Someone will break it
        print "error"
