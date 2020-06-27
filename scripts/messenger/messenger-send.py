#!/usr/bin/python3
##
## Messenger app - sends some notification to mobile phone
## Uses Telegram. TD 06/2020
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

logging.basicConfig(level=logging.DEBUG)

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
	ch.setLevel(logging.DEBUG)
	logger.addHandler(ch)
setup_logger()

##
## Default variables & Config
##
default_configfile = '/etc/tbs/tbs.conf'
default_parse_mode = "HTML"

## Argument parsing

parser = argparse.ArgumentParser(prog='messenger-send', usage='%(prog)s [options]', description='Sending messages with Telegram.')
parser.add_argument('-c', '--configfile', dest='configfile', default=default_configfile, metavar='FILE', type=str, help='Path to configfile')
parser.add_argument('-r', '--receipient', dest='receipient', required=True, metavar='MESSENGER_ID', type=str, help='Receipient number')
parser.add_argument('-m', '--message', dest='message', required=True, metavar='MESSAGE', type=str, help='The message to be sent')
parser.add_argument('-p', '--parse_mode', dest='parse_mode', metavar='MODE', default=default_parse_mode, choices=['HTML', 'MARKDOWN'], help='Choose a special parse mode for the message')
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
# https://github.com/eternnoir/pyTelegramBotAPI/blob/master/telebot/apihelper.py

import telebot

token = messenger["bot_id"] + ":" + messenger["api_key"]
logger.debug(f"Creating bot instance with token: {token}")
bot = telebot.TeleBot(token)

receipient = args.receipient
message = args.message
parse_mode = args.parse_mode

# Lookup for known numbers in config file
if receipient in messenger["receipients"]:
	logger.debug(f"Replacing {receipient} with {messenger['receipients'][receipient]}")
	receipient = messenger["receipients"][receipient]

logger.debug(f"Sending message to {receipient}: {message}")
bot.send_message(receipient, message, parse_mode=parse_mode)