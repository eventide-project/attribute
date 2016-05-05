require_relative 'bench_init'

module DefaultVisibility
  class Example
    include Proof::Attribute

    Attribute::Define.(self, :some_attr)
  end
end

context "Default Visibility" do
  test "Is a reader" do
    example = DefaultVisibility::Example.new
    assert(example.reader? :some_attr)
  end
end
