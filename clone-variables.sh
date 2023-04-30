#!/bin/env bash

for d in $(ls -d */)
do
    cp ./variables.tf ${d}/variables.tf
done