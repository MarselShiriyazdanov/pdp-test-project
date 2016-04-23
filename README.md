PDP test project
-

Third-party service badges (if available)

[![Build Status](https://semaphoreci.com/api/v1/MarselShiriyazdanov/pdp-test-project/branches/master/badge.svg)](https://semaphoreci.com/MarselShiriyazdanov/pdp-test-project)
[![Test Coverage](https://codeclimate.com/repos/5499a62c69568048ce005b09/badges/fd447e3575ba73aefc1a/coverage.svg)](https://codeclimate.com/repos/5499a62c69568048ce005b09/feed)
[![Code Climate](https://codeclimate.com/repos/5499a62c69568048ce005b09/badges/fd447e3575ba73aefc1a/gpa.svg)](https://codeclimate.com/repos/5499a62c69568048ce005b09/feed)

test project.
-

Dependencies

- PostgreSQL 9.3
  - `brew install postgres`
- Ruby 2.3.0
  - `rbenv install 2.3.0`
- Rails 4.2.6

Quick Start
-

Clone this repo:

```
git clone git@github.com:account/repo.git
cd repo
```

Run bootstrap script

```
bin/setup
```

Initializers
-

* `requires.rb` - automatically requires everything in lib/ & lib/extensions

Scripts
-

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

Production
-
https://still-spire-1631.herokuapp.com/
