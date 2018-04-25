# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'
gem 'active_model_serializers', '~> 0.10.7'
gem 'bcrypt', '~> 3.1.7'
gem 'cancancan', '~> 2.1', '>= 2.1.3'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'devise_token_auth', '~> 0.1.43'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.1.6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'carrierwave', '~> 1.2', '>= 1.2.2'

group :development, :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'ffaker', '~> 2.8', '>= 2.8.1'
  gem 'pry', '~> 0.11.3'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

group :development do
  gem 'listen', '~> 3.1', '>= 3.1.5'
end
