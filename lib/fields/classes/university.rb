module MyFields
  class University < Field

    attr_accessor :row_id
    
    def initialize(row_id = nil)
      if row_id
        self.row_id = row_id
        
        rel = UsersUniversity.find(row_id)
        @university = rel.university
        @country = rel.university.city.country
        @city = rel.university.city
        @faculty = rel.university.faculties.where(:id => rel.faculty_id).first
        @status = Setting.studentstatuses.where(:id => rel.studentstatus_id).first
      else
        @university = @country = @city = @faculty = @status = nil
      end
      
    end
    
    def html(type)
      erb = ERB.new(File.read(File.dirname(__FILE__) + "/../views/html/" + self.class.name.demodulize.downcase + "/" + type.to_s + ".html.erb"))
      func = ERB.new(File.read(File.dirname(__FILE__) + "/../views/js/functions.js"))
      js = ERB.new(File.read(File.dirname(__FILE__) + "/../views/js/callbacks.js"))
      erb.result(binding).html_safe + func.result.html_safe + js.result.html_safe
    end
    
   
  end
end