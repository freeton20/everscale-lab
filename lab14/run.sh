#!/usr/bin/env bash

everdev se reset  &> /dev/null
everdev sol compile A.sol

everdev c deploy A.abi.json -d "a:1" -v 1000000000  | grep deployed

echo "Before:"
everdev c l A.abi.json a -d "a:1" | grep \"a\" | xargs

echo "Now we are calling to changeStatic function:"
everdev c r A.abi.json changeStatic -d "a:1" | grep \"success\" | xargs

echo "After:"
everdev c l A.abi.json a -d "a:1" | grep \"a\" | xargs
