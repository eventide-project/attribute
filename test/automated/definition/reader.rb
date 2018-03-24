require_relative '../../test_init'

context "Definition" do
  context "Reader" do
    example = Attribute::Controls::Reader.example

    test "Has an attribute reader" do
      assert(example.respond_to? :some_attr)
    end

    test "Has no attribute writer" do
      refute(example.respond_to? :some_attr=)
    end
  end
end
