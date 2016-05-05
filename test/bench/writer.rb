require_relative 'bench_init'

module Writer
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr, :writer)
  end
end

context "Writer" do
  test "Is a writer" do
    example = Writer::Example.new
    assert(example.writer? :some_attr)
  end
end
