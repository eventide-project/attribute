require_relative 'automated_init'

context "Accessor" do
  example = Attribute::Controls::Accessor.example
  value = SecureRandom.hex

  test "Writes" do
    refute_raises do
      example.some_attr = value
    end
  end

  test "Reads" do
    assert(example.some_attr == value)
  end
end
