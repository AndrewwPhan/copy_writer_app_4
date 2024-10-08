source "https://rubygems.org"

ruby '3.3.5'  

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'devise'
gem 'ruby-openai'
gem "tzinfo-data"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'rspec-rails'
  gem 'factory_bot_rails', '~> 6.4.3' 
end

group :development do
  gem "web-console"
end

group :test do
  gem 'faker'              
  gem 'database_cleaner'   
  gem 'shoulda-matchers'   
end