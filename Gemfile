source 'https://rubygems.org'

gem 'rails', '3.2.11'

# controller related
gem 'cancan'

# model related
gem 'sqlite3'

# view related
gem 'haml'
gem 'sass'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', :git => 'http://github.com/anjlab/bootstrap-rails.git'
gem 'bootstrap_helper', git: 'git://github.com/albb0920/bootstrap-helper.git'
gem 'kaminari'
gem 'nested_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'chosen-rails'
end

gem 'jquery-rails'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development, :test do
  gem "rspec-rails", "~> 2.0"
  gem 'debugger'
  gem 'factory_girl_rails'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
end
