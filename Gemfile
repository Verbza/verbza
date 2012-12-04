source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'devise'
gem "paperclip", "~> 3.0"
gem 'aws-sdk'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  # gem "twitter-bootstrap-rails"

  gem "jquery_mobile_rails", "~> 1.2.0"

end

gem 'jquery-rails'




group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem 'jasmine'

  platform :ruby_19 do
     gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
     gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
     gem "ruby-debug19"
  end

  gem 'quiet_assets'
end

group :test do
  gem "faker"
  gem "database_cleaner"
  gem 'capybara'
  gem 'launchy'
end
#gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
