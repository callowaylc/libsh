export SHELL=/bin/sh
ENV ?= /dev/null
CMD ?= :

.DELETE_ON_ERROR:
.PHONY: check install
.DEFAULT_GOAL := check

check:
# execute test cases in test
	for t in tests/test_*; do
	  bash tests/teardown > /dev/null 2>&1
	  bash "$t" > /dev/null 2>&1
	  if [[ $? == 0 ]]; then
	    echo -e "\e[1;32mPASSED\e[0m : $t"
	  else
	    echo -e "\e[1;31mFAILED\e[0m : $t"
	    exit_code=1
	  fi
	  bash tests/teardown > /dev/null 2>&1
	done
	exit "$exit_code"

posix:
# run argument on alpine shell
# NOTE: no envs
	sh/posix.sh $(CMD)