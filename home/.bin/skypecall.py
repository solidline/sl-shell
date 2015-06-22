#!/usr/bin/env python

# Idea taken from:
# http://community.skype.com/t5/Mac/Re-Pause-option-when-dialing/td-p/731820

import argparse
import codecs
import re
import subprocess
import sys

# This will be prepended to any phone number that doesn't already start with it.
REQUIRED_PREFIX = "+1"

def applescript_run(script):
    """Runs the specified AppleScript. Returns the output.

    """
    osa = subprocess.Popen(['osascript', '-'],
                           stdin=subprocess.PIPE,
                           stdout=subprocess.PIPE)
    return osa.communicate(script)[0]

def clean_phone_number(phone_number, required_prefix):
    """Sanitizes a phone number. Prepends the required_prefix if
    phone_number doesn't already start with it.

    """
    phone_number = re.sub(r'[^0-9+]', '', phone_number)

    if not phone_number.startswith(required_prefix):
        phone_number = required_prefix + phone_number

    return phone_number

def get_call_with_dtmf_applescript(phone_number, dtmf):
    """Generates an AppleScript to use Skype to call the specified phone
    number, wait 10 seconds, then send the specified DTMF sequence.
    Commas are interpreted as 2 second delays.

    """
    return """
on CallWithDTMF(phone_number, dtmf)
    tell application "Skype"
        set active_call to send command "CALL " & phone_number script name ""
        set skype_call_id to word 2 of active_call
        delay 10

        set bridge to "ALTER CALL " & skype_call_id & " DTMF "
        repeat with tone in the characters of dtmf
            if tone contains "," then
                delay 2
            else
                send command bridge & " " & tone script name "s2"
                delay 0.2
            end if
        end repeat
    end tell
end CallWithDTMF

CallWithDTMF("%(phone_number)s", "%(dtmf)s")
""" % { 'phone_number': phone_number, 'dtmf': dtmf }

def parse_args(argv):
    if argv is None:
        argv = sys.argv[1:]

    parser = argparse.ArgumentParser()
    parser.add_argument('phone_number', help='phone number to dial')
    parser.add_argument('dtmf', help='DTMF string to send')
    return parser.parse_args(argv)

def skypecall(phone_number, dtmf, required_prefix=REQUIRED_PREFIX):
    phone_number = clean_phone_number(phone_number, required_prefix)
    applescript_run(get_call_with_dtmf_applescript(phone_number, dtmf))

def main(argv=None):
    options = parse_args(argv)
    skypecall(options.phone_number, options.dtmf)

if __name__ == "__main__":
    sys.exit(main())
