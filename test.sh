#!/bin/bash
set -e
xmllint data/modules.xml
for i in data/*/*.xml; do
  xmllint $i
done
