class Reader
  include Proof::Attribute

  Attribute.define self, :some_attr, :reader
end

describe Reader do
  subject(:reader) { Reader.new }

  specify 'Is a reader' do
    expect(reader.reader? :some_attr).to be(true)
  end
end
