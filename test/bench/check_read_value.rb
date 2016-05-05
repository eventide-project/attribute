require_relative 'bench_init'

module CheckReadValue
  class Error < RuntimeError; end

  class Example
    Attribute::Define.(self, :some_attr, :accessor, -> (val) { raise Error unless val == 'some value' })
  end
end

context "Check Read Value" do
  example = CheckReadValue::Example.new

  test "Pass" do
    example.some_attr = 'some value'
    example.some_attr
  end

  test "Fail" do
    example.instance_exec do
      @some_attr = 'some other value'
    end

    assert proc { example.some_attr } do
      raises_error? CheckReadValue::Error
    end
  end
end
