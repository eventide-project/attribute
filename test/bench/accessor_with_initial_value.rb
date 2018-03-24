require_relative 'bench_init'

module AccessorWithInitialValue
  class Example
    Attribute::Define.(self, :some_attribute, :accessor) do
      :some_initial_value
    end
  end
end

context "Reader with Initial Value" do
  example = AccessorWithInitialValue::Example.new

  context "Assigned a nil value" do
    example.some_attribute = nil

    test "Retains the nil value rather than reverting to the default value" do
      assert(example.some_attribute.nil?)
    end
  end
end
