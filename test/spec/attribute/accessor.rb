class Accessor
  include AttributeProof

  Attribute.define self, :some_attr, :accessor
end

describe Accessor do
  subject(:accessor) { Accessor.new }

  specify 'Is an accessor' do
    expect(accessor.accessor? :some_attr).to be(true)
  end
end
