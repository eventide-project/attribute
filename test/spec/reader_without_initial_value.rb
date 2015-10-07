module ReaderWithoutInitialValue
  class Example
    Attribute::Define.(self, :some_attr)
  end
end

describe ReaderWithoutInitialValue::Example do
  context "Initial value is not given as part of the attribute definition" do
    specify "The attribute has no initial value" do
      expect(subject.some_attr).to be_nil
    end
  end
end
