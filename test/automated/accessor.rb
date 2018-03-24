require_relative '../test_init'

context "Accessor" do
  example = Attribute::Controls::Accessor.example
  value = SecureRandom.hex

  test "Writes" do
    example.some_attr = value
  end

  test "Reads" do
    assert(example.some_attr == value)
  end
end
