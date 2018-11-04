# Attribute

Define an attribute on a class using an imperative API.

## Example

``` ruby
class Something
  attribute :some_attribute
  attribute :some_other_attribute
end

something = Something.new

something.some_attribute = 'Some Value'
something.some_other_attribute = 'Some Other Value'

puts something.some_attribute
# => "Some Value"

puts something.some_other_attribute
# => "Some Other Value"
```

## License

The `attribute` library is released under the [MIT License](https://github.com/eventide-project/attribute/blob/master/MIT-License.txt).
