#!/usr/bin/env bash

function do_netcat {
	nc -z -v ${1} ${2}
}

function do_ping {
	ping -c 1 ${1}
}

function do_connectivity_test {
	echo "Connectivity test for ${3} [${1}:${2}]"
	do_netcat ${1} ${2}
	do_ping ${1}
	echo "-------------------------------------"
}

do_connectivity_test 203.4.179.96 6980 "Order Entry Primary"
do_connectivity_test 203.4.179.97 6980 "Order Entry Secondary"
do_connectivity_test 203.4.179.100 7980 "Market Data Primary"
do_connectivity_test 203.4.179.101 7980 "Market Data Secondary"
do_connectivity_test 203.4.179.98 7990 "Drop Copy Primary"
do_connectivity_test 203.4.179.99 7990 "Drop Copy Secondary"
