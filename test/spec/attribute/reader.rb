class Reader
  Attribute.define self, :some_attr, :reader
end

describe Reader do
  subject(:reader) { Reader.new }

  specify 'Has a getter' do
    expect(reader).to respond_to :some_attr
  end

  specify 'Has no setter' do
    expect(reader).not_to respond_to :some_attr=
  end
end
