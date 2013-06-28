# Hydra Capybara Walkthrough

This is a Hydra-powered Rails project built with the goal of helping you write
your first set of tests. You can follow the changes to the code by replaying the
commit history.

## Running the tests

The first time you run the tests, you will first need to run:

    $ rake jetty:config

Then you will need jetty running:

    $ rake jetty:start

*This will daemonize a Jetty instance. You can stop the instance via:*

    $ rake jetty:stop

Wait a minute for Jetty to load (Its a slow to load Java app).

Then run your tests:

    $ rake

If you make changes, re-rerun `$ rake`

## My Testing Philosophy

The Open Source ecosystem is fast-moving. Things are evolving. I write tests to

* better understand the problem I'm trying to solve
* help ease the pain of change
* improving my chances of finding problems with the changes

Therefore if I am going to use Rails, I must write tests.