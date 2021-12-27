#!/usr/bin/python3
##
## Messenger app using pushover
## TD 12/2020
##
## Requires module pyTelegramBotAPI
##

import logging
import json
import os.path
import argparse

##
## Logging
##

logging.basicConfig(level=logging.WARNING)

def setup_logger():
	global logger
	# Remove default handler
	logger = logging.getLogger()
	while logger.hasHandlers():
		logger.removeHandler(logger.handlers[0])

	logger = logging.getLogger("messenger")

	formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
	ch = logging.StreamHandler()
	ch.setFormatter(formatter)
	ch.setLevel(logging.WARNING)
	logger.addHandler(ch)
setup_logger()

##
## Default variables & Config
##
default_configfile = '/etc/tbs/tbs.conf'
default_parse_mode = "HTML"
default_priority = "0"

## Argument parsing

parser = argparse.ArgumentParser(prog='messenger-send', usage='%(prog)s [options]', description='Sending messages with Telegram.')
parser.add_argument('-c', '--configfile', dest='configfile', default=default_configfile, metavar='FILE', type=str, help='Path to configfile')
parser.add_argument('-r', '--receipient', dest='receipient', required=True, metavar='MESSENGER_ID', type=str, help='Receipient device')
parser.add_argument('-m', '--message', dest='message', required=True, metavar='MESSAGE', type=str, help='The message to be sent')
parser.add_argument('-t', '--title', dest='title', metavar='TITLE', type=str, help='Optional title')
parser.add_argument('-p', '--parse_mode', dest='parse_mode', metavar='MODE', default=default_parse_mode, choices=['HTML'], help='Choose a special parse mode for the message')
parser.add_argument('-n', '--priority', dest='priority', metavar='PRIORITY', default=default_priority, choices=['-2','-1','0','1','2'], help='Prio - send as -2 to generate no notification/alert, -1 to always send as a quiet notification, 1 to display as high-priority and bypass the users quiet hours, or 2 to also require confirmation from the user')
args = parser.parse_args()

###############

# Parse config file

configfile = args.configfile
logger.debug("Using config file " + configfile)
if not os.path.isfile(configfile):
	logger.critical('Config file not found: ' + configfile)

with open(configfile) as config_file:
    config = json.load(config_file)

messenger = config['messenger']

###############
# Send messages

receipient = args.receipient
message = args.message
parse_mode = args.parse_mode
title = args.title
priority = args.priority

if parse_mode == "HTML":
	html = "1"
else:
	html = "0"


logger.debug(f"Sending message to {receipient}: {message}")

import http.client, urllib
conn = http.client.HTTPSConnection("api.pushover.net:443")
conn.request("POST", "/1/messages.json",
  urllib.parse.urlencode({
    "token": messenger["pushover_token"],
    "user": messenger["pushover_user"],
    "message": message,
    "device": receipient,
    "title": title,
    "priority": priority,
    "html": html
  }), { "Content-type": "application/x-www-form-urlencoded" })
conn.getresponse()