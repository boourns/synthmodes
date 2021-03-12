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

echo "running render_web_data"
bundle exec ruby ./tools/render_web_data.rb 
