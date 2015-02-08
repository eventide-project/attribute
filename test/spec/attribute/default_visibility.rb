class DefaultVisibility
  include Proof::Attribute

  Attribute.define self, :some_attr
end

describe DefaultVisibility do
  subject(:default_visibility) { DefaultVisibility.new }

  specify 'Is a reader' do
    expect(default_visibility.reader? :some_attr).to be(true)
  end
end
