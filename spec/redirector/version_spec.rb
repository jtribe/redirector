require 'spec_helper'
require 'redirector/version'

describe "Path Version" do
  
  it "should not be nil" do
    Redirector::VERSION.should_not be_nil
  end
end