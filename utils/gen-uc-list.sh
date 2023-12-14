#!/usr/bin/env bash
[[ $* =~ \S?\-\-debug\S? ]] && set -o xtrace

grep "## UC" docs/development/analysis/use-cases.md |
    sed "s/## //" |
    sed -r "s/UC([0-9]) -/UC0\1 -/g"
