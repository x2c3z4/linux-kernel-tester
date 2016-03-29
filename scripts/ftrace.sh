#!/bin/bash

[[ $1 = "" ]] && echo "Please give your command!" && exit
cmd=$@
echo $cmd
KDBGPATH="/sys/kernel/debug/tracing"
echo function_graph > $KDBGPATH/current_tracer
echo funcgraph-abstime > $KDBGPATH/trace_options
echo funcgraph-proc > $KDBGPATH/trace_options
echo userstacktrace > $KDBGPATH/trace_options
echo 0 > $KDBGPATH/tracing_on
echo > $KDBGPATH/trace
echo 1 > $KDBGPATH/tracing_on ; $cmd ; echo 0 > $KDBGPATH/tracing_on
cat $KDBGPATH/trace > test.ftrace
