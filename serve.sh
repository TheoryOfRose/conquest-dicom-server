#!/bin/bash

export CONQUEST=/conquestdicomserver
chmod 777 ${CONQUEST}/dgate
./dgate -w${CONQUEST} -v

