require_relative 'spec_init'

module Reader
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr, :reader)
  end
end

context "Reader" do
  example = Reader::Example.new

  test "Is a reader" do
    assert(example.reader? :some_attr)
  end

  test "Has no initial value" do
    assert(example.some_attr.nil?)
  end
end
