module Redirector
  class NotFound
    
    def self.content(filepath)
      self.new(filepath).content
    end
    
    attr_accessor :path
    
    def initialize(filepath)
      @path = filepath
    end
    
    def content 
      # Read the contents of 404.html
      file_exists? ? file_contents : 'Not found'
    end

    private

    def file_contents
      IO.read(path)
    end
    
    def file_exists?
      File.exists? path
    end
    
  end
end