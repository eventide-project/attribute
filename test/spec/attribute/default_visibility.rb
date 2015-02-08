class DefaultVisibility
  Attribute.define self, :some_attr
end

describe DefaultVisibility do
  subject(:default_visibility) { DefaultVisibility.new }

  specify 'Is a reader' do
    expect(default_visibility).to respond_to :some_attr
    expect(default_visibility).not_to respond_to :some_attr=
  end
end
