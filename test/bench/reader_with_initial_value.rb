require_relative 'bench_init'

module ReaderWithInitialValue
  class Example
    Attribute::Define.(self, :some_attr) do
      :some_initial_value
    end
  end
end

context "Reader with Initial Value" do
  test "The reader's value is the initial value" do
    example = ReaderWithInitialValue::Example.new
    assert(example.some_attr == :some_initial_value)
  end
end
