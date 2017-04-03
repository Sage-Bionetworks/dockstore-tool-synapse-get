#!/usr/bin/env python
import sys
try:
    import configparser
except ImportError:
    import ConfigParser as configparser

def main(argv):
    configPath = argv[0]
    config = configparser.ConfigParser()
    config.read(configPath)
    username = config.get('authentication', 'username')
    password = config.get('authentication', 'password')
    print("{} {}".format(username, password))

if __name__ == "__main__":
    main(sys.argv[1:])
