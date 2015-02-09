module Reader
  class Example
    include Proof::Attribute

    Attribute::Define.! self, :some_attr, :reader
  end
end

describe Reader::Example do
  specify "Is a reader" do
    expect(subject.reader? :some_attr).to be(true)
  end

  specify "Has no initial value" do
    expect(subject.some_attr).to be_nil
  end
end
