#!/bin/bash
set -e

echo "running xmllint"

xmllint data/modules.xml > /dev/null
for i in data/*/*.xml; do
  xmllint $i > /dev/null
done

# TODO
# format of xml files
# existence of referenced HTML files

#for i in data/*/*.html; do
#  tidy -e $i
#done

echo "rendering web data"
cd web
yarn install
yarn run build


