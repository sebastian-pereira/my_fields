module MyFields
  class Text < Field

    attr_accessor :label, :name, :options, :method
    
    def initialize(name, method, label, options)
      self.label, self.method, self.name, self.options = label, method, name, options
    end
    
  end
end