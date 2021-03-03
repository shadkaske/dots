#!/bin/bash

mbsync -a

kill -9 $(pgrep -f 'mu server') &> /dev/null

mu index
