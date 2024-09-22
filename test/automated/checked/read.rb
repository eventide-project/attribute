require_relative '../automated_init'

context "Checked" do
  context "Read" do
    context "Passes" do
      example = Attribute::Controls::Checked.example

      test do
        refute_raises(Attribute::Controls::Checked::Error) do
          example.some_attr
        end
      end
    end

    context "Fails" do
      example = Attribute::Controls::Checked.example

      example.instance_exec do
        @some_attr = 'some other value'
      end

      test do
        assert_raises(Attribute::Controls::Checked::Error) do
          example.some_attr
        end
      end
    end
  end
end
