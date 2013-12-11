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


###404 file

The middleware will attempt to read the contents of 404.html at the rack root

    RACK_ROOT/404.html

If this file doesn't exist, it will only return text 'Not found'
*(This should be rolled into a config)*


##Testing

[![Build Status](https://travis-ci.org/jtribe/redirector.png?branch=master)](https://travis-ci.org/jtribe/redirector)

Testing on the following rubies... 
                                   
* 2.0.0                            
* 1.9.3                            
* 1.9.2                            

Note there is no 1.8.*


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
