ruby '2.0.0'

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 4.2.3'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '>= 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# App Server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# NewRelic
gem 'newrelic_rpm'

# Use debugger
gem 'debugger', group: [:development, :test]

# Auth
gem 'devise', '3.5.3'
gem 'devise_token_auth', '0.1.37.beta4'
gem 'omniauth', '1.2.2'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-facebook', '2.0.1'

# For APIs
gem 'grape', '~> 0.9.0'
gem 'grape-jbuilder'
gem 'rack-jsonp-middleware'
gem 'rack-contrib'
group :development, :test do
  gem 'json_expressions'
end

# SITEMAP
gem 'sitemap_generator'
gem 'meta-tags', :require => 'meta_tags'

# Google Analytics
gem 'google-analytics-rails'

# Paging
gem 'kaminari'
gem 'jquery-turbolinks'

# config
gem 'config'

gem 'kakurenbo-puti'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'pry'

  # Normalize
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', '~> 3.0'
  gem 'rubocop'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :production, :staging do
  gem 'rails_12factor'
end
