require_relative '../automated_init'

context "Initial Value" do
  context "Has Initial Value" do
    example = Attribute::Controls::Accessor::InitialValue.example

    test do
      assert(example.some_attr == :some_initial_value)
    end
  end
end
