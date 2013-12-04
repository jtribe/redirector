$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rack/test'
require 'redirector/app'


RSpec.configure do |config|
  config.color
  config.order = 'random'
  
  config.before(:all) do
    ENV['PWD'] = File.join(File.dirname(__FILE__), 'sample')
  end
  
end
