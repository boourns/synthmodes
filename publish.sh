#!/bin/bash

echo "<modules>" > modules.xml
cat modules/*.xml >> modules.xml
echo "</modules>" >> modules.xml
cp modules.xml ~/Code/Swift/disting/disting/data
