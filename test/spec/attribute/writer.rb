class Writer
  Attribute.define self, :some_attr, :writer
end

describe Writer do
  subject(:writer) { Writer.new }

  specify 'Has no getter' do
    expect(writer).not_to respond_to :some_attr
  end

  specify 'Has a setter' do
    expect(writer).to respond_to :some_attr=
  end
end
