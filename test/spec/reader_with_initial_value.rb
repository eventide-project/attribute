require_relative 'spec_init'

module ReaderWithInitialValue
  class Example
    Attribute::Define.(self, :some_attr) do
      :some_initial_value
    end
  end
end

describe "Initial value is given as part of the attribute definition" do
  specify "The attribute's value is the initial value" do
    example = ReaderWithInitialValue::Example.new
    assert(example.some_attr == :some_initial_value)
  end
end
