class Writer
  include AttributeProof

  Attribute.define self, :some_attr, :writer
end

describe Writer do
  subject(:writer) { Writer.new }

  specify 'Is a writer' do
    expect(writer.writer? :some_attr).to be(true)
  end
end
