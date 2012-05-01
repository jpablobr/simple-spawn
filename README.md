# Simple::Spawn [![Build Status](https://secure.travis-ci.org/jpablobr/simple-spawn.png?branch=master)][travis]

[travis]: http://travis-ci.org/jpablobr/simple-spawn

Simple processes spawner that makes scripting UNIX pipes a breeze.

Most of it was inspired by https://github.com/jstorimer/shirt Thx! :)

## Installation

Add this line to your application's Gemfile:

    gem 'simple-spawn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple-spawn

## Usage

It only requires a valid `shell` command as a string.


```ruby
spawn('cat ./stars.txt | grep charlie | sed s/winning/bi-winning/')
```

### Simple::Spawn as a Mixin

The `Simple::Spawn` module can also be mixed in to classes and modules
to include the `spawn` method in that namespace:

```ruby
require simple/spawn

class YourScriptClass
  include Simple::Spawn

  def replace(what, with)
    spawn("cat ./stars.txt | grep charlie | sed s/#{what}/#{with}/")
  end
end
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## ACKNOWLEDGEMENTS

Copyright (c) by
[Jose Pablo Barrantes](http://jpablobr.com)

See the `COPYING` file for more information on license and redistribution.
