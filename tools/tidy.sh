#!/bin/bash

for i in data/*/*.html; do
  tidy -i -o $i $i
done

xmllint --output data/modules.xml --format data/modules.xml

for i in data/*/*.xml; do
  xmllint --output $i --format $i
done

