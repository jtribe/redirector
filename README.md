# Redirector

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'redirector', :git => 'git@github.com:jtribe/redirector.git'

And then execute:

    $ bundle


## Usage

We expect there to be a yaml file in the site root
which contains old urls and their new url

    SITE_ROOT/config/redirects/pages.yml
    
Sample of what this file should look like
**note** that the key is the old url

    '/path/to/old/page': '/new-url'
    '/path/to/old/about': '/about'
    
    
For simplicity, we remove any trailing slashs prior to attempting to match urls. 
*This is to reduce duplication*


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
