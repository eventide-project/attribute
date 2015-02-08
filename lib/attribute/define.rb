module Attribute
  class Define
    attr_reader :target_class
    attr_reader :name
    attr_reader :visibility

    def initialize(target_class, name, visibility=nil)
      visibility ||= :reader

      @target_class = target_class
      @name = name
      @visibility = visibility
    end

    def self.!(target_class, name, visibility)
      instance = new target_class, name, visibility
      instance.!
    end

    def !
      define_getter if [:reader, :accessor].include? visibility
      define_setter if [:writer, :accessor].include? visibility
    end

    def define_getter
      name = self.name
      target_class.send :define_method, name do
        instance_variable_get("@#{name}")
      end
    end

    def define_setter
      name = self.name
      target_class.send :define_method, "#{name}=" do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
