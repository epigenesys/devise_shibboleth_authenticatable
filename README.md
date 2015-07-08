devise_shibboleth_authenticatable
=================================

Originally written by [Joe George](https://github.com/jgeorge300/devise_shibboleth_authenticatable), and forked from the changes made by [UW Center for Commercialization](https://github.com/UWC4C/devise_shibboleth_authenticatable).

The updates to this fork have been inspired by [devise_cas_authenticatable](https://github.com/nbudin/devise_cas_authenticatable/).

devise_shibboleth_authenticatable is a [Shibboleth](https://shibboleth.net/)-based authentication strategy for the [Devise](http://github.com/plataformatec/devise) authentication framework.

Requirements
------------

* Rails (tested on 4.2)
* Devise (tested on 3.5)
* [Shibboleth SP](https://wiki.shibboleth.net/confluence/display/SHIB2/NativeSPLinuxInstall)

Installation
------------

Inside your `Gemfile`, add:

    gem 'devise'
    gem 'devise_shibboleth_authenticatable', github: 'epigenesys/devise_shibboleth_authenticatable'`

Setup
-----

Under construction

Contributing
------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

License
-------

Copyright (c) 2011 Joe George.

See `LICENSE.txt` for further details.
