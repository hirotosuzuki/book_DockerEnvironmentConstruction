#!/bin/sh

trap_term_signal() {
    echo "trapped SIGTERM"
	exit 0
}

trap_some_signal() {
    echo "trapped 1 or 2 or 3 SIGNAL"
}

trap "trap_term_signal" TERM
trap "trap_some_signal" 1 2 3

while :
do
    echo "running..."
    sleep 3
done
