require 'spec_helper'
require 'redirector/path_detection'

describe "Path Detection" do
  
  describe "hits" do
   
    
    it "should return '/services' from '/android`" do
      Redirector::Lookup.pages('/android').should == '/services'
    end

    it "should return 'about' from 'we-do'" do
      Redirector::Lookup.pages('/we-do').should == '/about'
    end
  end
  
  
  describe "misses" do
    
    ['/bacon', '/nil/value'].each do |val|
      it "should return nil from #{val}" do
        Redirector::Lookup.pages(val).should be_nil
      end
    end
  end
end