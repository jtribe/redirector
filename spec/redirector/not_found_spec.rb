require 'spec_helper'

describe "Not found" do
  
  before(:each) do
    @not_found = Redirector::NotFound.new
  end
  
  it "should have a path to 404.html" do
    @not_found.send(:file_path).should =~ Regexp.new('sample/404.html')
  end
  
  it "should read contents of 404.html" do
    @not_found.content.should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
  it "should read contents of 404.html (from class method)" do
    Redirector::NotFound.content.should =~ Regexp.new('<h1>not found</h1>', 'i')
  end
  
end