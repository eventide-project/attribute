class Accessor
  Attribute.define self, :some_attr, :accessor
end

describe Accessor do
  subject(:accessor) { Accessor.new }

  specify 'Has a getter' do
    expect(accessor).to respond_to :some_attr
  end

  specify 'Has a setter' do
    expect(accessor).to respond_to :some_attr=
  end
end
