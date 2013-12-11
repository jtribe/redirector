require 'spec_helper'

describe "Not found" do
  
  before(:each) do
    @not_found = Redirector::NotFound.new
  end
  
  
  describe "asset path" do
    
    it "should have a default containing 404.html" do
      @not_found.send(:asset_path).should =~ Regexp.new('sample/404.html')
    end

    it "should use the filepath passed in" do
      @not_found.send(:asset_path, 'errors/missing.html').should =~ Regexp.new('sample/errors/missing.html')
    end
  end
  
  it "should read contents of 404.html" do
    @not_found.content.should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
  it "should read contents of 404.html (from class method)" do
    Redirector::NotFound.content.should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
end