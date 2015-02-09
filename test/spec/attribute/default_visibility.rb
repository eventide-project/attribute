module DefaultVisibility
  class Example
    include Proof::Attribute

    Attribute::Define.! self, :some_attr
  end
end

describe DefaultVisibility::Example do
  specify "Is a reader" do
    expect(subject.reader? :some_attr).to be(true)
  end
end
