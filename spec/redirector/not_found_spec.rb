require 'spec_helper'

describe "Not found" do
  
  before(:each) do
    
    @config = Redirector::Config.new
    @not_found = Redirector::NotFound.new(@config.page_missing)
  end
  
  it "should use the user supplied value/path (missing.html)" do
    @not_found.path.should =~ Regexp.new('sample/missing.html$')
  end
  
  it "should read contents of 404.html" do
    @not_found.content.should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
  it "should read contents of 404.html (from class method)" do
    Redirector::NotFound.content(@config.page_missing).should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
end