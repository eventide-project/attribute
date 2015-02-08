module Attribute
  def define(target_class, name, visibility=nil)
    Define.! target_class, name, visibility
  end
  module_function :define
end
