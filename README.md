# HumanColour

Simple gem for taking an RGB colour string, and converting it into a human-friendly name.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add human_colour
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install human_colour
```

## Usage

```ruby
  HumanColour.parse("rgb(128,64,0)")
  #=> "dark orange"

  # Return a colour based on the provided locale
  HumanColour.parse("rgb(128,64,0)", locale: :es)
  #=> "naranja oscuro"
```

![alt text](https://github.com/mconnell/human_colour/blob/main/doc/colours.png?raw=true)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
