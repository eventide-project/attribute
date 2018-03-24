require_relative '../../test_init'

context "Checked" do
  context "Write" do
    context "Passes" do
      example = Attribute::Controls::Checked.example

      test do
        refute proc { example.some_attr = 'some value'} do
          raises_error? Attribute::Controls::Checked::Error
        end
      end
    end

    context "Fails" do
      example = Attribute::Controls::Checked.example

      test do
        assert proc { example.some_attr = 'some other value'} do
          raises_error? Attribute::Controls::Checked::Error
        end
      end
    end
  end
end
