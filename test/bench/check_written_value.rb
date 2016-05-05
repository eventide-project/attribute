require_relative 'bench_init'

module CheckWrittenValue
  class Error < RuntimeError; end

  class Example
    Attribute::Define.(self, :some_attr, :accessor, -> (val) { raise Error unless val == 'some value' })
  end
end

context "Check Written Value" do
  example = CheckWrittenValue::Example.new

  test "Pass" do
    example.some_attr = 'some value'
  end

  test "Fail" do
    assert proc { example.some_attr = 'some other value' } do
      raises_error? CheckWrittenValue::Error
    end
  end
end
