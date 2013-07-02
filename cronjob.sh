#!/usr/bin/env bash

ONE_PLUS_ONE_ROOT=$(dirname "$file")
cd $ONE_PLUS_ONE_ROOT; source $ONE_PLUS_ONE_ROOT/env.sh;

bundle install

rake scheduler:mailing 2>> cron.log >> cron.log
