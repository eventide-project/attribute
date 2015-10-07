module Accessor
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr, :accessor)
  end
end

describe Accessor::Example do
  specify "Is an accessor" do
    expect(subject.accessor? :some_attr).to be(true)
  end
end
