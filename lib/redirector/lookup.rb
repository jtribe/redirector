require 'yaml'

module Redirector
  class Lookup
      
    def self.pages path
      @pages_content ||= self.new.content
      @pages_content[path]
    end               
      
    attr_accessor :pwd, :content

    def initialize
      # load up the pages.yml
      @content = load_yaml(pages_path)
    end
    
    private              
                         
    def load_yaml path   
      File.open(path) { |file| YAML.load(file) }    
    end
    
    def pages_path
      File.join base_path, 'pages.yml'
    end
    
    def base_path
      File.join(pwd, 'config/redirects')
    end
    
    def pwd
      ENV['PWD']
    end
    
  end
end