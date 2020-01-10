#!/usr/bin/env bash

function sigterm() {
    echo "Caugh Term"
    kill -TERM $PID
    wait $PID
    exit
}
trap sigterm TERM

function sigint() {
    echo "Caugh Int"
    kill -TERM $PID
    wait $PID
    exit
}
trap sigint INT

sleep 300s &

PID=$!

wait $PID
