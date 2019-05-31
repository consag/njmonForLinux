#!/usr/bin/python

import sys
import time

while True:
  line=sys.stdin.readline().rstrip()
  if line:       
    sys.stdout.write(line[::-1]+'\n')
  else:
    sys.stdout.flush()
    time.sleep(1)

