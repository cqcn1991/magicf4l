source 'https://rubygems.org'

gem 'rails','3.2.13'
gem 'bootstrap-sass', '2.3.2'
gem 'devise'
gem 'simple_form'
gem 'font-awesome-rails', '3.2.1.1'
gem 'nokogiri'
gem 'imgkit'
gem 'pdfkit'
gem 'httparty'
#gem 'phantomjs'
gem 'carrierwave'
#gem 'vulcan'
#gem 'wkhtmltopdf-heroku'
#gem 'newrelic_rpm'


gem 'will_paginate-bootstrap'
gem 'will_paginate', '~> 3.0'

gem 'omniauth-twitter'
gem 'omniauth-weibo-oauth2'
gem 'jquery-ui-rails'
gem 'activerecord-reputation-system'
gem 'cancan'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  #gem 'pg'
  gem 'rspec-rails', '2.11.0'
  gem 'sunspot_solr'
end

group :production do
  gem 'activerecord-postgresql-adapter'
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
#gem 'unicorn'

if !RUBY_PLATFORM=~ /win32/
  gem 'unicorn'
end

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'
