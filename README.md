# Remindice

This gem is a simple reminder.
You can add, remove, and list tasks.
If you want, you can roll the dice and choose a task to do.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remindice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install remindice

## Usage

`$ remindice add "write reports" "attend a programming contest"`
`$ remindice remove "throw up a tooth`
`$ remindice clear` (You can also use `remove` with `--all` or `-a` instead of this)
`$ remindice list`
`$ remindice roll`

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Roadagain/remindice.

