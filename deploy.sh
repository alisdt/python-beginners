#!/bin/bash

#scp -r * root@softdev.ppls.ed.ac.uk:/var/www/deploy/online_experiments
rsync -av \
  _build/html/en/* \
  softdevppls001@softdev.ppls.ed.ac.uk:/home/softdevppls001/public_html/turtles
