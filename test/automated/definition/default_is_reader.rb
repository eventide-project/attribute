require_relative '../automated_init'

context "Definition" do
  context "Default is Reader" do
    example = Attribute::Controls::Reader::Default.example

    test "Has an attribute reader" do
      assert(example.respond_to? :some_attr)
    end

    test "Has no attribute writer" do
      refute(example.respond_to? :some_attr=)
    end
  end
end
