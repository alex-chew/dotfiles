#!/usr/bin/env python

import os
import sys
import subprocess as sp
import json

here = os.path.dirname(os.path.realpath(sys.argv[0]))
with open('config.json') as cfg_file:
	cfg = json.load(cfg_file)

for s, d in cfg.iteritems():
	# Check for existence of s
	if (not os.path.isfile(s)):
		print('{}: source file not found'.format(s))
		continue

	# Expand user alias in destination path
	d = os.path.expanduser(d)

	# If link, make backup as a file and remove existing
	if (os.path.islink(d)):
		if (sp.call(['cp', '-L', d, '{}.old'.format(d)]) == 0):
			print('{}: destination backup from link made'.format(s))
		else:
			print('{}: destination backup from link could not be made'.format(s))
		if (sp.call(['rm', d]) == 0):
			print('{}: old link removed'.format(s))
		else:
			print('{}: old link could not be removed'.format(s))
	
	# If file, make backup
	elif (os.path.isfile(d)):
		if (sp.call(['mv', d, '{}.old'.format(d)]) == 0):
			print('{}: destination backup made'.format(s))
		else:
			print('{}: destination backup could not be made'.format(s))

	# If directory, don't touch it
	elif (os.path.isdir(d)):
		print('{}: destination is directory; could not be deployed'.format(s))
		continue

	# Create the link
	if (sp.call(['ln', '-s', os.path.join(here, s), d]) == 0):
		print('{}: link at {} created'.format(s, d))
	else:
		print('{}: link at {} could not be created'.format(s, d))

