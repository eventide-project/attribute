require_relative '../../test_init'

context "Checked" do
  context "Read" do
    context "Passes" do
      example = Attribute::Controls::Checked.example

      test do
        refute proc { example.some_attr } do
          raises_error? Attribute::Controls::Checked::Error
        end
      end
    end

    context "Fails" do
      example = Attribute::Controls::Checked.example

      example.instance_exec do
        @some_attr = 'some other value'
      end

      test do
        assert proc { example.some_attr } do
          raises_error? Attribute::Controls::Checked::Error
        end
      end
    end
  end
end
