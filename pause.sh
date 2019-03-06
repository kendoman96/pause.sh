#!/bin/bash
#
# Event handler for the download disk
#

case "$1" in
OK)
        # Do noting
        ;;
WARNING)
        # Do nothing
        ;;
UNKNOWN)
        # Do nothing
        ;;
CRITICAL)
        # Case check for hard or soft state
        case "$2" in

        # We're in a "soft" state, meaning that Nagios is in the middle of retrying the
        # check before it turns into a "hard" state and contacts get notified...
        SOFT)

                case "$3" in

                3)
                        #Do nothing
                        ;;
                        esac
                ;;

        # Note: Contacts have already been notified of a problem with the service at this
        # point (unless you disabled notifications for this service)
        HARD)
                transmission-remote $IP:$PORT --auth $USER:$PASS -t all --stop
                ;;
        esac
        ;;
esac
exit 0
