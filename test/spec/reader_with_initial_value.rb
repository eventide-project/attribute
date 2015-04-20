module ReaderWithInitialValue
  class Example
    Attribute::Define.! self, :some_attr do
      :some_initial_value
    end
  end
end

describe ReaderWithInitialValue::Example do
  context "Initial value is given as part of the attribute definition" do
    specify "The attribute's value is the initial value" do
      expect(subject.some_attr).to eq(:some_initial_value)
    end
  end
end
