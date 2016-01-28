require_relative 'spec_init'

module ReaderWithoutInitialValue
  class Example
    Attribute::Define.(self, :some_attr)
  end
end

context "Initial value is not given as part of the attribute definition" do
  test "The attribute has no initial value" do
    example = ReaderWithoutInitialValue::Example.new
    assert(example.some_attr.nil?)
  end
end
