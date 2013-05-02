# encoding: utf-8
module MyFields
  class Field
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper
  
    attr_reader :name, :method, :label, :value, :visible, :options, :errors
    
    
    def html(type)
      if @visible and @visible != '0'
        erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/html/" + self.class.name.demodulize.downcase + "/" + type.to_s + ".html.erb"))
        erb.result(binding).html_safe
      end
    end
    
    def initialize(name, method, label, value = nil, visible = true, options = {})
      @name = name
      @method = method
      @label = label
      @value = value
      @visible = visible
      @options = options
      @errors = []
      validate_values
    end
    
    private 
    
    def validate_values
      if @value =~ /.*[а-я]+.*/i
        @errors.push Errors::Value.new(@method, 'Russian letters unavailable.')
      end
    end
    
  end
end