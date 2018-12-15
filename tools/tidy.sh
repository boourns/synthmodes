#!/bin/bash

for i in data/*/*.html; do
  tidy -i -o $i $i
done

