module MyFields
  class Link
    
    include ActionDispatch::Routing
    include Rails.application.routes.url_helpers
    include ActionView::Helpers::UrlHelper

    attr_reader :label, :controller, :action, :params
    def initialize(label, controller, action = :index, params = {})
      unless params.instance_of? Hash
        
      end
      @label = label
      if controller.instance_of? Array
        @controller = controller.join('/')
      else
        @controller = controller
      end
      
      @action = action
      @params = params
    end
    
    def html
      erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/html/link/template.html.erb"))
        erb.result(binding).html_safe
    end
    #attr_accessor :label, :name, :options, :method, :value
    
    
  end
end