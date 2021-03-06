Bootstrap 4 Example in Haml&Sass/Rails
================

Getting Started
---------------

- Copy config/secrets.sample.yml to config/secrets.yml. Modify config/secrets.yml to your taste but don't commit it.
- [Live Demo](https://mysterious-shore-48399.herokuapp.com)
- [GitHub vochicong/bootstrap4-haml-rails](https://github.com/vochicong/bootstrap4-haml-rails)

Documentation and Support
-------------------------

- This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).
- Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).
- [Creating a Heroku remote](https://devcenter.heroku.com/articles/git#creating-a-heroku-remote)
- [Run command on Heroku](https://devcenter.heroku.com/articles/one-off-dynos#types-of-one-off-dynos)
  ```
  $ heroku run gem install bundler
  ```
- [Heroku GitHub integration](https://devcenter.heroku.com/articles/github-integration)
- [Ruby project on Travis CI](https://docs.travis-ci.com/user/languages/ruby/)
- [Haml reference](http://haml.info/docs/yardoc/file.REFERENCE.html)
- [Sample CircleCI configuration](https://circleci.com/docs/1.0/config-sample/)
- [CircleCI configuration for Heroku deployment](https://circleci.com/docs/1.0/continuous-deployment-with-heroku/)
- [Cloud SQL for Rails](https://cloud.google.com/appengine/docs/flexible/ruby/using-cloud-sql?authuser=3#setting_up_your_local_environment)

Requirements
-------------

- Ruby 2.4.1
- Rails 5.0.1
- Bootstrap 4

Testing
--------

```
$ bundle install
$ bundle exec rails test
$ bundle exec guard
```

Issues
-------------
- [env_variables in app.yaml is not available during docker build](https://github.com/vochicong/bootstrap4-haml-rails/issues/11)

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
