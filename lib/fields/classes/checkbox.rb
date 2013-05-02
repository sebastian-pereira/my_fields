module MyFields
  class Checkbox < Field

    def initialize(name, method, label, value = nil, visible = true, options = {})
      super(name, method, label, value.to_i, visible, options)
    end
  
    
    
  end
end