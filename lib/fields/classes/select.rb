module MyFields
  class Select < Field

    attr_reader :values
    def initialize(name, method, label, value = nil, visible = true, options = {})
      @values = []
      super(name, method, label, value, visible, options)
    end
  
    def set_values(values)
      @values = values
    end
    
  end
end