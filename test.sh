#!/bin/bash
set -e
xmllint data/modules.xml
for i in data/*/*.xml; do
  xmllint $i
done

# TODO
# format of xml files
# existence of referenced HTML files

#for i in data/*/*.html; do
#  tidy -e $i
#done

