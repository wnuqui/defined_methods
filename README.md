# DefinedMethods

`DefinedMethods` is a utility module that returns **methods defined in a given object**. These methods are NOT from included or extended modules. These methods are also NOT from parent objects. By object, it means either a `class` or `module`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'defined_methods'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defined_methods

## Usage

Given a class:
```ruby
class Arithmeter
  def self.sum(a, b)
    arithmeter = new
    arithmeter.add a, b
  end

  def add(a, b)
    do_add a, b
  end

  private

  def do_add(a, b)
    perform_addition a, b
  end

  protected

  def perform_addition(a, b)
    a + b
  end
end
```

When calling `DefinedMethods.in(Arithmeter)`, it will return
```ruby
[{:object_name=>"Arithmeter",
  :object=>#<Class:Arithmeter>,
  :methods=>[:sum],
  :private=>false,
  :protected=>false,
  :singleton=>true},
 {:object_name=>"Arithmeter",
  :object=>#<Class:Arithmeter>,
  :methods=>[],
  :private=>true,
  :protected=>false,
  :singleton=>true},
 {:object_name=>"Arithmeter",
  :object=>#<Class:Arithmeter>,
  :methods=>[],
  :private=>false,
  :protected=>true,
  :singleton=>true},
 {:object_name=>"Arithmeter",
  :object=>Arithmeter,
  :methods=>[:add],
  :private=>false,
  :protected=>false,
  :singleton=>false},
 {:object_name=>"Arithmeter",
  :object=>Arithmeter,
  :methods=>[:do_add],
  :private=>true,
  :protected=>false,
  :singleton=>false},
 {:object_name=>"Arithmeter",
  :object=>Arithmeter,
  :methods=>[:perform_addition],
  :private=>false,
  :protected=>true,
  :singleton=>false}]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wnuqui/defined_methods. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DefinedMethods project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/defined_methods/blob/master/CODE_OF_CONDUCT.md).
