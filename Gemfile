source 'https://rubygems.org'
ruby '2.1.2'

gem 'bootstrap-sass'
gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'haml-rails'
gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '2.99'
  gem 'fabrication'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '1.4.1'
  gem 'shoulda-matchers', '2.7.0'
  gem 'vcr', '2.9.3'
end

group :production do
  gem 'rails_12factor'
end