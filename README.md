# Sitejabber

This is a basic integration to Sitejabber's API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sitejabber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sitejabber

## Configuration

There are a few settings that have to be set globally:

```ruby
# In Rails, you could put this in config/initializers/sitejabber.rb
Sitejabber.redis = ConnectionPool.new { Redis.new( url: REDIS_URL ) }

# Required
Sitejabber.api_key = MY_API_KEY
Sitejabber.api_email = MY_API_EMAIL
Sitejabber.api_password = MY_API_PASSWORD

# Optional
Sitejabber.default_domain = MY_DEFAULT_DOMAIN # ex: github.com
```

**Note Important Note:** This gem requires Redis to work. It uses a Redis server to store access tokens.

## Usage

### Reviews

If you set your domain globally, you can do:

```ruby
Sitejabber::Review.new.create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'foo@bar.com',
  title: 'This is awesome!!!',
  rating: '5',
  content: 'Fell in love first week of owning.',
  order_id: 'ABC123'  
)

# Check Sitejabber API docs for required and optional parameters.
```

You can also specify your domain by review, for example:

```ruby
Sitejabber::Review.new("github.com").create(
  first_name: 'John',
  last_name: 'Doe',
  email: 'foo@bar.com',
  title: 'This is awesome!!!',
  rating: '5',
  content: 'Fell in love first week of owning.',
  order_id: 'ABC123'  
)

# Check Sitejabber API docs for required and optional parameters.
```

TODO: add more examples

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/goldbely/sitejabber-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sitejabber project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/goldbely/sitejabber-ruby/blob/master/CODE_OF_CONDUCT.md).
