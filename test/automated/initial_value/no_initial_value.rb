require_relative '../../test_init'

context "Initial Value" do
  context "No Initial Value" do
    example = Attribute::Controls::Accessor.example

    test do
      assert(example.some_attr == nil)
    end
  end
end
