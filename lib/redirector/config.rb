require 'yaml'

# Attempts to read a config file

module Redirector
  class Config
    
    attr_accessor :content
  
    def initialize
      @content = read_config
    end

    def page_missing
      File.join(ENV['PWD'], @content['page_missing'])
    end
    
    private
    
    def read_config
      File.open(config) { |file| YAML.load(file) }
    end         
                
    def config  
      File.join(config_dir,'config.yml')
    end
    
    # Return the config file (if it exists) - otherwise use defaults
    def config_dir
      user_config_exists? ? user_config_dir : default_dir
    end
    
    def user_config_exists?
      File.exists? user_config_path
    end
    
    def user_config_path
      File.join(user_config_dir, 'config.yml')
    end
    
    def user_config_dir
      File.join(ENV['PWD'],'config','redirector')
    end

    # If we can't find a config file, we'll need some defaults
    def default_dir
      File.join(File.dirname(__FILE__), 'defaults')
    end
    
  end
end