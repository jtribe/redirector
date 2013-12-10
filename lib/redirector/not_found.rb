module Redirector
  class NotFound
    
    def self.content
      self.new.content
    end
    
    def content
      # Read the contents of 404.html
      file_exists? ? file_contents : 'Not found'
    end              
                     
    private          
                     
    def file_contents
      IO.read(file_path)
    end
    
    def file_path
      File.join ENV['PWD'], '404.html'
    end
    
    def file_exists?
      File.exists? file_path
    end
    
  end
end