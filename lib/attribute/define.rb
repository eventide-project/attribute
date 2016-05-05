module Attribute
  module Define
    extend self

    def call(target_class, attr_name, visibility=nil, check_value=nil, &initialize_value)
      visibility ||= :reader

      if [:reader, :accessor].include? visibility
        define_reader(target_class, attr_name, visibility, check_value, &initialize_value)
      end

      if [:writer, :accessor].include? visibility
        define_writer(target_class, attr_name, visibility, check_value, &initialize_value)
      end
    end
    class << self; alias :! :call; end # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

    def define_reader(target_class, attr_name, visibility, check_value, &initialize_value)
      attr_name = :"#{attr_name}" unless attr_name.is_a? Symbol
      var_name = "@#{attr_name}"
      target_class.send :define_method, attr_name do
        val = instance_variable_get(var_name)

        unless val
          if initialize_value
            val = initialize_value.()
            instance_variable_set var_name, val
          end
        end

        if check_value
          check_value.(val)
        end

        val
      end
    end

    def define_writer(target_class, attr_name, visibility, check_value, &initialize_value)
      attr_name = :"#{attr_name}" unless attr_name.is_a? Symbol
      writer_name = :"#{attr_name}="
      var_name = "@#{attr_name}"
      target_class.send :define_method, writer_name do |val|
        if check_value
          check_value.(val)
        end

        instance_variable_set var_name, val
      end
    end
  end
end
