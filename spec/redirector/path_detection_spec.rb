require 'spec_helper'
require 'redirector/path_detection'

describe "Path Detection" do
  
  describe "blog post" do
    
    describe "positive detection" do
      
      [ '/1999/12/party-on',
        '/2001/01/an-oddity',
        '/2009/02/a-little-party',
        '/2011/10/happy-birthday'].each do |val|
        it "should say #{val} is a post blog" do
          Redirector::PathDetection.new(val).should be_blog_post
        end
      end
    end
    
    describe "negative detection" do
      
      [ '/bacon',
        '/bacon/cheese',
        '/200/tasty/cheeses',
        '/2011/mmm-bacon'].each do |val|
        it "should say #{val} is a not post blog" do
          Redirector::PathDetection.new(val).should_not be_blog_post
        end
      end
    end
  end

  describe "pages" do
    
    describe "positive detection" do
      
      [ '/we-do',
        '/ios',
        '/intro'].each do |val|
        it "should say #{val} is a page" do
          Redirector::PathDetection.new(val).new_path.should_not be_nil
        end
      end
    end
    
    describe "negative detection" do
      
      [ '/nil',
        '/nothing/here',
        '/go/home'].each do |val|
        it "should say #{val} is a not page" do
          Redirector::PathDetection.new(val).new_path.should be_nil
        end
      end
    end
  end
end