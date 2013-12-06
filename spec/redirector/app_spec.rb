require 'spec_helper'
require 'redirector/app'

describe "App" do
  
  include Rack::Test::Methods
  
  def app
    Redirector::App #.new
  end
  
  
  describe "positive detection (301)" do
    
    describe "blog posts" do
      
      [ '/1999/12/party-on',
        '/2001/01/an-oddity',
        '/2009/02/a-little-party',
        '/2011/10/happy-birthday'].each do |val|
          
        before(:each) do
          get val
        end
        
        it "should respond to '#{val} with a redirect (301)" do
          last_response.status.should == 301
        end
          
        it "should redirect '#{val}' to the blog" do
          last_response.location.should =~ Regexp.new('^http://blog.')
        end
      end
    end
    
    describe "pages" do
      
      # note trailing slash
      [ '/android-training',
        '/android-training/',
        '/hire-us',  
        '/hire-us/', 
        '/we-do',
        '/we-do/',
        '/ios-training-course-outline'].each do |val|
          
        before(:each) do
          get val
        end
        
        it "should respond to '#{val}' with a redirect (301)" do
          last_response.status.should == 301
        end
            
        it "should redirect '#{val}' to a new page" do
          last_response.location.should =~ Regexp.new('^/[a-z]')
        end
      end
    end
  end
  
  describe "negative detection (404)" do
    
    [ '/bacon',
      '/bacon/cheese',
      '/200/tasty/cheeses',
      '/2011/mmm-bacon'].each do |val|
      it "should say #{val} is a not post blog" do
        
        get val
        last_response.status.should == 404
      end
    end
  end

end