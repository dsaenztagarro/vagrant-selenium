# vi: set ft=ruby :
source 'https://rubygems.org'

# Specify your gem's dependencies in vagrant-selenium.gemspec
gemspec

group :development do
  gem 'vagrant', git: 'https://github.com/mitchellh/vagrant.git', tag: 'v1.6.2'
end

# Because vagrant plugin commands don't work in development, this is how you
# "install" your plugin into Vagrant. Vagrant will automatically load any gems
# listed in the "plugins" group. Note that this also allows you to add multiple
# plugins to Vagrant for development, if your plugin works with another plugin.
group :plugins do
  gem 'vagrant-selenium', path: '.'
end
