# Money

Welcome to your new money gem! 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'money'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install money

## Usage

  Set the conversion rate
```ruby
Money.conversion_rates('EUR', {'USD' => 1.11, 'Bitcoin' => 0.0047})
```

```ruby
fifty_eur = Money.new(50, 'EUR')
fifty_eur.inspect
fifty_eur.convert_to('EUR')
```

## Airthmetic Method
```ruby
twenty_dollars = Money.new(20, 'USD')
twenty_dollars.convert_to('EUR')
fifty_eur + twenty_dollars 
```

```ruby
fifty_eur - twenty_dollars 
fifty_eur / 2
twenty_dollars * 3
```

## Comparision Operation

```ruby

twenty_dollars == Money.new(20, 'USD')
twenty_dollars == Money.new(30, 'USD')

fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur == fifty_eur_in_usd

twenty_dollars > Money.new(5, 'USD')
twenty_dollars < fifty_eur
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/money. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

