require_relative '../../test_init'

context "Checked" do
  context "Write" do
    context "Passes" do
      example = Attribute::Controls::Checked.example

      test do
        refute_raises(Attribute::Controls::Checked::Error) do
          example.some_attr = 'some value'
        end
      end
    end

    context "Fails" do
      example = Attribute::Controls::Checked.example

      test do
        assert_raises(Attribute::Controls::Checked::Error) do
          example.some_attr = 'some other value'
        end
      end
    end
  end
end
