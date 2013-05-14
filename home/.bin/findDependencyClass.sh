#!/bin/bash

# © Kasper van den Berg <kasper@kaspervandenberg.net>, 2013
# LICENCE Creative commons  Attribution 3.0 <http://creativecommons.org/licenses/by/3.0/>

CLASS_PATTERN=$1

function usage() {
	echo "Usage:" $0 "{regexp}"
	echo
	echo "Search all jars from Maven project's depencies for a class that matches the regular expression {regexp}"

	exit
}

if [ -z "$1" ]; then usage; fi

MAVEN=/usr/bin/mvn

IFS=":"		# use ":" as field separator to split classpath

# Iterate over every jar on the build path, ignore lines starting with "[INFO]"
for i in `${MAVEN} dependency:build-classpath | grep -v '^\[INFO\]'`; do
	# format each line as "{jar name}	{class name}
	jar tf $i | awk "{print \"$i\\t\" \$1}";
done \
| grep ${CLASS_PATTERN}

