require_relative 'spec_init'

module DefaultVisibility
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr)
  end
end

describe "Default Visibility" do
  specify "Is a reader" do
    example = DefaultVisibility::Example.new
    assert(example.reader? :some_attr)
  end
end
