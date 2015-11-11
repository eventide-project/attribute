require_relative 'spec_init'

module Writer
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr, :writer)
  end
end

describe "Writer" do
  specify "Is a writer" do
    example = Writer::Example.new
    assert(example.writer? :some_attr)
  end
end
