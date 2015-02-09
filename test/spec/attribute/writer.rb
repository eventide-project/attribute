module Writer
  class Example
    include Proof::Attribute

    Attribute::Define.! self, :some_attr, :writer
  end
end

describe Writer::Example do
  specify 'Is a writer' do
    expect(subject.writer? :some_attr).to be(true)
  end
end
