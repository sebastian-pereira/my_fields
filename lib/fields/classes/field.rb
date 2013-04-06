class MyFields::Field
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormOptionsHelper

  attr_accessor :name
  
  def html(type)
    erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/html/" + self.class.name.demodulize.downcase + "/" + type.to_s + ".html.erb"))
    erb.result(binding).html_safe
  end
  
end