require 'redirector/lookup'

module Redirector
  class PathDetection

    attr_accessor :path, :new_path, :path_parts
    
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
      
      @path_parts = @path.dup.split('/')
      @path_parts.delete_at(0)

      # Path needs to contain exactly 3 components
      return false unless path_parts.count == 3
      return false unless has_year? && has_month?
                                                  
      # We have a blog post
      true

    end

    private

    # We need exactly 4 digits to make a year
    def has_year? 
      @path_parts[0] =~ /[0-9]{4}/
    end

    # We need exactly 2 digits to make a month
    def has_month?
      @path_parts[1] =~ /[0-9]{2}/
    end

  end
end