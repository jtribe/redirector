require 'redirector/lookup'

module Redirector
  class PathDetection

    attr_accessor :path, :new_path
    
    def initialize(path)
      
      # Find the requested path in the pages
      @path = path
      @new_path = if blog_post?
                    blog_url(@path)
                  else
                    find_in_pages(@path)
                  end    
      
    end
    
    private
    
    def find_in_pages(path)
      Redirector::Lookup.pages(path)
    end
    
    def blog_url(path)
      "http://blog.jtribe.com.au#{path}"
    end
    
    def blog_post?
      
      path_parts = @path.dup.split('/')
      path_parts.delete_at(0)
      

      # Path needs to contain 3 components
      # parts 1 and 2 need to be numbers
      return false unless path_parts.count == 3
      return false unless is_number? path_parts[0]
      return false unless is_number? path_parts[1]
      
      # We have a blog post
      true
      
    end
    
    def is_number? val
      !val.to_i.zero?
    end
    
  end
end