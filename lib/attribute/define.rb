module Attribute
  class Define
    attr_reader :target_class
    attr_reader :attr_name
    attr_reader :visibility
    attr_reader :initialize_value

    def initialize(target_class, attr_name, visibility=nil, &initialize_value)
      visibility ||= :reader

      @target_class = target_class
      @attr_name = attr_name
      @visibility = visibility
      @initialize_value = initialize_value
    end

    def self.call(target_class, attr_name, visibility=nil, &initialize_value)
      instance = new target_class, attr_name, visibility, &initialize_value
      instance.()
    end
    class << self; alias :! :call; end # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

    def call
      define_reader if [:reader, :accessor].include? visibility
      define_writer if [:writer, :accessor].include? visibility
    end
    alias :! :call # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

    def define_reader
      attr_name = :"#{self.attr_name}"
      var_name = "@#{attr_name}"
      initialize_value = self.initialize_value
      target_class.send :define_method, attr_name do
        val = instance_variable_get(var_name)

        unless val
          if initialize_value
            val = initialize_value.()
            instance_variable_set var_name, val
          end
        end

        val
      end
    end

    def define_writer
      attr_name = :"#{self.attr_name}"
      writer_name = :"#{attr_name}="
      var_name = "@#{attr_name}"
      target_class.send :define_method, writer_name do |val|
        instance_variable_set var_name, val
      end
    end
  end
end
