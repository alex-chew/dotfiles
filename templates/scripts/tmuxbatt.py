import os
import re
import shlex
import subprocess as sp
import sys

if os.path.exists('/sys/class/power_supply/BAT0'):
	batt_loc = '/org/freedesktop/UPower/devices/battery_BAT0'
	command = 'upower -i {}'.format(batt_loc)
	try:
		cmd_output = sp.check_output(shlex.split(command))
		outstr = ''
		
		# Battery percentage
		perc = re.search(r'percentage:\s+([\d%]+)', cmd_output)
		if perc:
			outstr += perc.group(1)

		# State: [discharging | charging | fully-charged]
		state = re.search(r'state:\s+(\w)', cmd_output)
		if state:
			outstr += ' ('
			# Time to [full|empty]
			timeto = re.search(r'time to \w+:\s+([\d\.]+) (\w)', cmd_output)
			
			if timeto:
				outstr += (''
						+ str(int(round(float(timeto.group(1)))))
						+ timeto.group(2)
						+ ' to ')

			outstr += state.group(1)
			outstr += ')'

		print('[ ' + outstr + ' ] ')
	except sp.CalledProcessError: # Exit code nonzero
		print('[ BATT SCRIPT ERROR ]')
		sys.exit()

# No battery on this computer
else:
	sys.exit()

