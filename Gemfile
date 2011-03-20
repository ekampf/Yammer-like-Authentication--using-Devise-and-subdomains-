source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Deploy with Capistrano
gem 'capistrano'

#Extra Gems
gem 'compass' 
gem 'devise', "~> 1.2.rc" # We need devise 1.2 for OmniAuth support
gem 'devise_invitable', :git => 'git://github.com/scambra/devise_invitable.git'
gem 'omniauth', :git => 'git://github.com/intridea/omniauth.git'
gem 'oa-openid', :require => 'omniauth/openid'  # OmniAuth OepnID support for Google Apps

gem 'friendly_id'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem "rspec-rails", "~> 2.4"
  gem 'webrat'
  gem 'factory_girl'
	gem 'factory_girl_rails'
	gem 'faker'
end
