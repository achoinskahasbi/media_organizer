#!/bin/bash
exit_code=0

echo ">>> media organizer tests"
if [ -z "$(which bundle)" ]; then
  gem install bundler
fi
bundle install | grep Installing

bundle exec rspec
exit_code+=$?

exit $exit_code
