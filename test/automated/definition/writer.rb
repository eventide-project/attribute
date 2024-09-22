require_relative '../automated_init'

context "Definition" do
  context "Writer" do
    example = Attribute::Controls::Writer.example

    test "Has an attribute writer" do
      assert(example.respond_to? :some_attr=)
    end

    test "Has no attribute reader" do
      refute(example.respond_to? :some_attr)
    end
  end
end
