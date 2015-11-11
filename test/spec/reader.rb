require_relative 'spec_init'

module Reader
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr, :reader)
  end
end

describe "Reader" do
  example = Reader::Example.new

  specify "Is a reader" do
    assert(example.reader? :some_attr)
  end

  specify "Has no initial value" do
    assert(example.some_attr.nil?)
  end
end
