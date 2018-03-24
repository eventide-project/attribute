require_relative '../../test_init'

context "Definition" do
  context "Accessor" do
    example = Attribute::Controls::Accessor.example

    test "Has an attribute reader" do
      assert(example.respond_to? :some_attr)
    end

    test "Has an attribute writer" do
      assert(example.respond_to? :some_attr=)
    end
  end
end
