# StylesheetsForAll

[![Gem Version](https://badge.fury.io/rb/stylesheets_for_all.png)](http://badge.fury.io/rb/stylesheets_for_all)

In a call to `stylesheet_link_tag` Rails will set `media=screen` which means that
by default if you print a web page it will look nothing like what it looks like one
the screen.  This plugin changes it so the default is `method=all`.

## Installation

Add this line to your application's Gemfile:

    gem 'stylesheets_for_all'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stylesheets_for_all

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
