# String#undump

Unofficial implementation of String#undump, does inverse of String#dump.
See [Feature #12275](https://bugs.ruby-lang.org/issues/12275) for details.

## Usage

```ruby
require 'string_undump'

puts '\u3059\u3054\u30FC\u3044'.undump #=> すごーい
puts '\xE3\x81\x9F\xE3\x81\xAE\xE3\x81\x97\xE3\x83\xBC'.undump #=> たのしー
puts '\u{1F43E}'.undump #=> 🐾
```

See [testcase](https://github.com/tadd/string_undump/blob/master/test/test_undump.rb) also.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_undump'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_undump

## Supported Ruby versions

2.0.0 or later.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tadd/string_undump.

## License

Ruby's.  See [COPYING](COPYING).
