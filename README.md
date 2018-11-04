# Attribute

Define an attribute on a class using an imperative API.

## Example

``` ruby
class Something
  Attribute::Define.(self, :some_accessor, :accessor)
  Attribute::Define.(self, :some_reader, :reader)
  Attribute::Define.(self, :some_writer, :writer)

  def initialize(some_accessor, some_reader, some_writer)
    @some_accessor = some_accessor
    @some_reader = some_reader
    @some_writer = some_writer
  end
end

something = Something.new(
  'Some Accessor Value',
  'Some Reader Value',
  'Some Writer Value'
)

## Accessor
puts something.some_accessor
# => "Some Accessor Value"

something.some_accessor = 'Some Other Value'
puts something.some_accessor
# => "Some Other Value"

## Reader
puts something.some_reader
# => "Some Reader Value"

something.some_reader = 'Some Other Value'
# => NoMethodError (undefined method `some_reader=' for #<Something:0x...>)

## Writer
puts something.some_writer
# => NoMethodError (undefined method `some_writer' for #<Something:0x...>)

something.some_writer = 'Some Other Value'
```

## License

The `attribute` library is released under the [MIT License](https://github.com/eventide-project/attribute/blob/master/MIT-License.txt).
