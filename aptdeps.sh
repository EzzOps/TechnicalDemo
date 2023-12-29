#!/bin/bash
set -eu

declare -a all_deps=( )
for pkg_name in "$@"
do
    declare -a deps=$(apt-cache depends -i --recurse $pkg_name | awk -F 'Depends: ' 'NF>1{ sub(/ .*/,"",$NF); print $NF }' | sort | uniq)
    all_deps+=$deps
done

printf '%s\n' "${all_deps[@]}" | sort | uniq