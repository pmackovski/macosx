#!/bin/bash

if [ `id -u` -ne 0 ]; then 
	echo "Please run as root" 
	exit 1 
fi

if [ "$#" -ne 2 ]; then
	echo "Usage: control_vpnagentd.sh {disable|enable} {unload|load}"
	exit 1
fi

launchctl $1 system/com.cisco.anyconnect.vpnagentd
launchctl $2 /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist

