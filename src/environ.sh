#!/usr/bin/env false
## Portable method to list envs for a given process
#$ environ.sh $pid
#> []string{ "$name=$value\n" }
set -eu

environ() { local pid=$1
# returns environment variables for given process id
	{ {
	cat /proc/$1/environ 1>&100 ||
	ps -Eww -o command= $1 \
		| perl -pe 's/([^\s]+=)/\n\1/gp' \
		| grep "="
	} 2>/dev/null 100>&1 >&200 \
		| xargs -r0 -n1
	} 200>&1

	# mark end of input if needed for downstream delimiting
	printf "\0"
}
