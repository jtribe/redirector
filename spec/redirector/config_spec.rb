require 'spec_helper'

describe "Config test" do
  
  before(:each) do
    @config = Redirector::Config.new
  end
  
  it "should have a payload from yaml" do
    @config.content.should be_instance_of(Hash)
  end
    
  it "should have a path to the page_missing" do
    @config.page_missing.should =~ Regexp.new('missing.html')
  end
  

  describe "paths to yaml" do
    
    it "should say 'config_dir' is supplied by the user" do
      @config.send(:config_dir).should =~ Regexp.new('sample/config/redirector$')
    end
  
    it "should say config exists" do
      @config.send(:user_config_exists?).should be_true
    end
  
    it "should have a default_dir" do
      @config.send(:default_dir).should =~ Regexp.new('lib/redirector/defaults$')
    end
  end
  
end