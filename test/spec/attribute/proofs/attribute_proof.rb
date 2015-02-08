module AttributeProof
  def reader?(attr_name)
    reads?(attr_name) && !writes?(attr_name)
  end

  def writer?(attr_name)
     writes?(attr_name) && !reads?(attr_name)
  end

  def accessor?(attr_name)
    reads?(attr_name) && writes?(attr_name)
  end

  def reads?(attr_name)
    respond_to? attr_name
  end

  def writes?(attr_name)
    respond_to? :"#{attr_name}="
  end
end
