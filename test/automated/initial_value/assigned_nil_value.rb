require_relative '../../test_init'

context "Initial Value" do
  example = Attribute::Controls::Accessor::InitialValue.example

  context "Assigned a nil value" do
    example.some_attr = nil

    test "Retains the nil value rather than reverting to the default value" do
      assert(example.some_attr.nil?)
    end
  end
end
