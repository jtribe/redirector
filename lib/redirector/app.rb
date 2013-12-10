# This is the rack app that is called when the web server
# can't find anything inside /public
require 'redirector/path_detection'
require 'redirector/not_found'

module Redirector
  class App
    
    attr_accessor :req, :res
    
    # =============================================
    # = Call is the entry point for all rack apps =
    # =============================================
    def self.call env
      self.new(env).call
    end
    
    def initialize(env)
      
      # Setup our request and response objects
      # note that we default to returning json
      @req = Rack::Request.new env
      @res = Rack::Response.new
    end
    
    def call
      
      new_path = Redirector::PathDetection.new(@req.path).new_path
      
      # if 'new_path' is nil, then we don't have a match
      # so we'll return a 404
      return not_found if new_path.nil?

      # otherwise we'll do a redirect
      redirect_to new_path
      
    end
    
    def redirect_to url
      # note that we're 'redirecting permanently'
      @res.redirect(url, 301)
      @res.finish
    end
    
    def not_found
      
      @res.status = 404
      @res.write(Redirector::NotFound.content)
      @res.finish
    end
    
    
  end
end
