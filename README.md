# Erb::View

[![Build Status](https://travis-ci.org/felipeelias/erb-view.svg?branch=master)](https://travis-ci.org/felipeelias/erb-view)
[![Gem Version](https://badge.fury.io/rb/erb-view.svg)](https://badge.fury.io/rb/erb-view)
[![Test Coverage](https://codeclimate.com/github/felipeelias/erb-view/badges/coverage.svg)](https://codeclimate.com/github/felipeelias/erb-view/coverage)
[![Code Climate](https://codeclimate.com/github/felipeelias/erb-view/badges/gpa.svg)](https://codeclimate.com/github/felipeelias/erb-view)
[![Issue Count](https://codeclimate.com/github/felipeelias/erb-view/badges/issue_count.svg)](https://codeclimate.com/github/felipeelias/erb-view)
[![Dependency Status](https://gemnasium.com/badges/github.com/felipeelias/erb-view.svg)](https://gemnasium.com/github.com/felipeelias/erb-view)
[![security](https://hakiri.io/github/felipeelias/erb-view/master.svg)](https://hakiri.io/github/felipeelias/erb-view/master)

Simple wrapper around ERB that lets you create class based views.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'erb-view'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install erb-view
```

## Usage

`Erb::View` lets you create reusable class based views. Start with a configuring the template directory

```ruby
Erb.root = 'lib/templates'
```

And then define your class.

```ruby
class IndexView
  include Erb::View

  # Reads a file named `index.erb` from the `root` specified
  template :index

  # This method is available on the ERB context
  def title
    'Index Page'
  end
end
```

In the `root` defined, create a file named `index.erb`

```html
<h1><%= title %></h1>
<p>Hello <%= name %>!</p>
```

And use it in your code

```ruby
view = IndexView.new
view.render(name: 'World')
```

The result will be

```html
<h1>Index Page</h1>
<p>Hello World!</p>
```

## Development

```sh
$ git clone git@github.com:felipeelias/erb-view.git
$ cd erb-view
$ bin/setup
$ rake test
```

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/felipeelias/erb-view.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
