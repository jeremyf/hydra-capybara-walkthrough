[Initial project creation \[3d2c350\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/3d2c35063d3e23a81c9e2fa83f433cd31c9ed86e)

    Commands:
    $ rails new hydra-capybara-walkthrough
    $ cd hydra-capybara-walkthrough
    $ git init
    $ git add .


[Updating the README to reflect purpose \[c23189c\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/c23189c17a978cbb97ecc6739a12e9f41acba618)

    This project is intended for helping a person new to Hydra, and possibly 
    Rails, to get started on writing tests.


[Manually adding hydra-head and blacklight gems \[1b2f954\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/1b2f9544e8141d9cb0fb169031ca9f5233e6ce0e)

    I am pegging the gem versions to specific hydra releases, so that I can more
    confidently say "this works" at later points in the future.


[Installing, via bundler, the gems \[158341c\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/158341cd983f79255ff494e8a4e18a01ff705d8b)

    Commands:
    $ bundle install


[Running blacklight generator \[820ee30\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/820ee30fb632e9a257376ac89e387083b5a38b84)

    Commands:
    $ rails g blacklight --devise


[Running hydra:head generator \[985d247\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/985d24747990acea77d9e4ca44cd8aa3d5a67515)

    Commands:
    $ rails g hydra:head -f


[Running database migrations \[ac3e987\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/ac3e987742e34ea054459b29418a4c3da0cad926)

    Commands:
    $ rake db:migrate


[Adding jetty and locking to appropriate version \[7750506\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/775050600bd647885b2c82fdafaf9dc7bb75c447)

    Scripts ran:
    $ git clone git://github.com/projecthydra/hydra-jetty.git jetty
    $ cd jetty && git co 60d7a4bff90ef4296a266ed9c5942c6d5c49cf3a
    $ cd jetty && rm -rf .git
    $ rake jetty:config


[Adding rspec-rails, database_cleaner, & capybara \[ecf7aba\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/ecf7aba00a135de590636680a7e53880348aceab)

    https://github.com/bmabey/database_cleaner


[Installing, via bundler, the gems \[63f44bf\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/63f44bf242cc2ab47c4f1d57e30d0d758f503b14)

    Commands:
    $ bundle


[Removing test directory \[e91d02e\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/e91d02ef445cf82ae2664d32bc86c9adc4a9b8e7)

    ProjectHydra makes use of rspec

    Scripts Run:
    $ rm -rf test


[Initializing project w/ rspec & database_cleaner \[6bff6a4\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/6bff6a4c2edc9081cac460ef7c7039475c213b08)

    I am also including the wiring for DatabaseCleaner and Rspec Rails.

    Database Cleaner ensures that each test run is against a clean DB. 
    https://github.com/bmabey/database_cleaner

    Commands run:
    $ rspec --init


[Adding spec and comments for testing catalog \[f7d44ae\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/f7d44ae1bbe2fbb62e72b7f9831cd64ad8ad5fe7)

    

[Updating application config to use rspec \[d2beef3\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/d2beef348cbe643166a8f54dfe1baed51e0fa2e3)

    Each Rails application can specify which Framework is used. By default the
    Hydra stack uses RSpec.


[Writing executable tests for capybara tests \[1c3b445\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/1c3b445c3f77e8a87b3675d2539ee0770853f017)

    

[Manually adding jettywrapper gem \[37a9afa\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/37a9afa4db24e887347f0d89f21985bf80f94c43)

    

[Installing, via bundler, the jettywrapper gem \[4d39cc9\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/4d39cc906304f0a844712413af5019fab7facb01)

    Commands:
    $ bundle


[Updating documentation with testing philosophy \[2829227\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/282922764ef9a20e515778a3e7415ea29bc3580b)

    

[Manually adding active-fedora gem \[8f9d2ab\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/8f9d2ab05ef0e58590b4a94759f7f7e5b3f25556)

    This is included in the hydra-head gem, but I want to reference the newer
    ActiveFedora::Base generators.


[Updating, via bundler, the active-fedora gem \[b7040e8\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/b7040e8158bdeef014d64a82a95ae14efde7ede8)

    Commands:
    $ bundle update active-fedora


[Adding Thing model and corresponding spec \[f7492b9\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/f7492b95ad33a8f0e9904e441f35e76851ae492e)

    Script
    $ rails generate active_fedora:model Thing


[Updating README to include how to run tests \[7792e91\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/7792e91905780ed036494828214d326be9a754e0)

    

[Changing README from rdoc to markdown \[55003af\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/55003af24853ebe738cd0d670690295eb15ec712)

    Personally, Markdown is so much more legible.


[Adding a datastream and title to Thing \[4c366ff\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/4c366ff891ba35ee7c74fa131c31554f742479cb)

    Given that the intended purpose of this project is to help you learn how 
    write tests, I'm going with an easier datastream first. Things get more 
    complicated as we move to datastreams that implement some semblance of 
    structure.


[Refactoring spec to consolidate behavior \[dcc4423\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/dcc4423b5877c7f319eeeff0d8d9c25fcc77ce20)

    It is good practice to clean up data from tests; After all each test should
    be repeatable and runnable in isolation. Most databases support transactions
    to ensure that data is clean between each run. And there are other paradigms
    (i.e. database_cleaner) for having a clean database.

    Unfortunately, Fedora doesn't easily support this. So instead we need to 
    clean up the file ourselves.


[Adding persistence verification for Thing \[bf9cf0f\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/bf9cf0fee1192527df3afaa3c704e9d4d1bed101)

    I want to make sure that the properties data stream is as expected. In this
    particular case, since we are using a very rudimentary, and ultimately
    meaningless schema, the verification is rather simplistic.

    It does, however, highlight a proof of concept for verification.

    @TODO - Extract the verify_persistence method into a custom matcher;
       Highlighting how to create a custom matcher is also a good exercise,
       as a custom matcher can provide greater clarity regarding what is
       begin tested.


[Extracting #verify_persistence to custom matcher \[88a5efa\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/88a5efaf13ae6ca2e6baf1a24d0a15231145de92)

    While techinically not a custom matcher, this extraction demonstrates some
    of Rspec's configuration options; Namely that we can mixin modules at "type
    of spec" level.


[Updating the README to explain rspec option \[05eeb5b\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/05eeb5b5891f0b211ffadcc0fc2dfbb0e79d2c7b)

    

[Adding the view/controller for Things \[246ada0\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/246ada0dcedd28665d128181ef6e62d9a0b982e3)

    By adding the title:string option to the generate command, my forms include
    the :title attribute of Thing.

    NOTE: At this point the tests are broken for two reasons:

    1) the command does not add the appropriate route 2) the Fedora objects
    created in the controller are not being cleaned up

    Commands:
    $ rails generate scaffold_controller Things title:string


[Adding :things resource \[e1e966f\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/e1e966f41510756055092450e6c73ecf10c538a4)

    This creates the necessary CRUD action for Things

    You can see what was created by running `rake routes`; This shows all of the
    routes available to the application. Not the various /things routes.


[Replacing Thing.last with controller variable \[09110e6\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/09110e65dfc206bb12f3b83248ccead497081553)

    ActiveFedora::Base does not implement the .last method; As such we need to
    change how that is being done.


[Fixing the build by smashing a problem \[bc6aa4e\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/bc6aa4ec0be739510733cd6828407059e82bcef7)

    Given that Fedora doesn't provide transactions in which we can run our 
    singular tests, each test is responsible for cleaning up after itself. This
    runs contrary to the Rails/Rspec generated controllers.


[Adding end to end test of creation \[5f8a30b\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/5f8a30b778197b9aba48eb52ff16434ba1142dbd)

    I want to verify that something created in the UI is persisted as expected.

    Note: I had to update the spec_helper.rb to make sure that the 
    verify_persistence "matcher" was mixed in to all of the feature specs.


[Renaming a method to be more descriptive \[e17d390\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/e17d39062d9f8ad31042c466b6a8777625348c01)

    For a future test, I'm going to be using the renamed method

        fedora_persistence_for


[Adding test to verify object view \[ea6d4db\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/ea6d4db60fc2541ae5e9ffb42cbc6202e2111398)

    This is not an exhaustive test as there could be many things touched when I
    view an object. However, those "things I could be touching" can be expanded
    upon.


[Adding spec to verify persistence changes via UI \[cd97dab\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/cd97dab2d03551a94272887d4d84b652b8a73cfa)

    Again this is not an exhaustive test as there are many things that go into
    persistence.


[Moving expected template to subdirectory \[a7ab008\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/a7ab0087a5a22cb9a8c8b8bf31761e05096b3a49)

    As we plan to expand what we test regarding persistence, I want to have a
    directory structure that can reflect these requirements.


[Adding wrapper method to encapsulate knowledge \[777555f\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/777555fc3eff3b18a9b6a3a8fdd53f1eecb199ce)

    There were two locations in which I was passing rather intimate knowledge of
    the required parameters to a test spec. By creating a wrapper function I can
    encapsulate that behavior.

    Also, through the encapsulation, I can began to expand the verification to
    test more than a single datastream


[Refactoring to require less system knowledge \[1bbd373\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/1bbd373dab732da136e04c220c4be2ddc0e9b106)

    This refactoring may look a bit backwards. Ultimately, I'm looking towards
    creating a class that can handle the two persistence questions:

        * Do I look as expected
       * Did I change as expected


[Extracting matchers into a custom class \[0d55c49\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/0d55c49bfaca70997d64914b1c6e56ede946783f)

    By extracting to a custom class I'm hoping to create a better method for 
    verifying the persistence changes.

    This is still looking a bit backwards as there are lots of methods being 
    written with lots of delegation.


[Refactoring to custom Rspec matcher \[8b37a78\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/8b37a780626099fcc2be8b007a5e048dff065e56)

    This is a rather major refactor and was in fact too large for a single 
    commit. There is a LOT going on with this commit. So I apologize for that.

    However, you now see how to move towards a custom matcher. I'm still not
    satisified as I beleive the ActiveFedora::PersistenceSpecHelper should be a
    class instead of a module; Sharing knowledge of instance variables across
    modules is a dangerous plan.

    However, I have settled on the API for the persistence tests. Which means I
    can grab the screen shots and proceed.


[Adding TODO for persistence validation \[0da2288\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/0da228852db65b327bb3737c643b3f7cec546ba4)

    

[Adding project license \[c0bfb71\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/c0bfb71abb1b8d0f59083429c734f108557ed175)

    

[Generating COMMIT-LOG-REVERSE.md for reference \[5334a6e\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/5334a6e34a338b27eddbc8a2a739e03829a1418e)

    Script
    $ git log --reverse --pretty="[%s \[%h\]](https://github.com/jeremyf/hydra-capybara-walkthrough/commit/%H)%n%n%w(80,4,4)%b%n"
    > COMMIT-LOG-REVERSE.md

    This commit was ammended via `git commit --amend` to ensure that
    COMMIT-LOG-REVERSE.md includes this commit message.


