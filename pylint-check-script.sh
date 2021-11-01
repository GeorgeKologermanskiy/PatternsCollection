#!/usr/bin/env bash

PYTHON_FILES=$(find . -name \*.py -print)

RES=$(pylint $PYTHON_FILES | tail -2)
echo $RES

SCORE=$(echo $RES | awk '{print $7}' | awk -F/ '{print $1}')
echo $SCORE | awk --source '{exit ($0 < 9.00)}'
