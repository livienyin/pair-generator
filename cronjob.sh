#!/usr/bin/env bash

# load rvm ruby
source /Users/livienyin/.rvm/environments/ruby-1.9.3-p392

bundle install

cd $ONE_PLUS_ONE_ROOT; source $ONE_PLUS_ONE_ROOT/env.sh;
rake --trace scheduler:mailing 2>> cron.log >> cron.log
