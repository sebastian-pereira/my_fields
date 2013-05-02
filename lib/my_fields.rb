module MyFields
  require 'fields/classes/errors/value'
  autoload :Field, 'fields/classes/field'
  autoload :Text, 'fields/classes/text'
  autoload :Link, 'fields/classes/link'
  autoload :Label, 'fields/classes/label'
  autoload :Hidden, 'fields/classes/hidden'
  autoload :Checkbox, 'fields/classes/checkbox'
  autoload :Select, 'fields/classes/select'
  autoload :Textarea, 'fields/classes/textarea'
  autoload :University, 'fields/classes/university'
  
   class Engine < Rails::Engine#:nodoc:
    initializer "initialize" do |app|
      ActionController::Base.send :include, MyFields
    end
   end
   
   def self.factory(type, id = nil)
     if id == nil
       ('MyFields::' + type.to_s.capitalize).classify.constantize.new
     else
       ('MyFields::' + type.to_s.capitalize).classify.constantize.new(id)
     end
      
   end
   
   
end