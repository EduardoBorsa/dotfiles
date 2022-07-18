#!/bin/sh

# terminate already running instances
killall -q polybar

# wait until they die of blood loss
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar bottom
#
# # #!/usr/bin/env bash
#
# #!/bin/sh
#
# # terminate already running instances
# killall -q polybar
#
# # Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log &
# disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log &
# disown
#
# echo "Bars launched..."
