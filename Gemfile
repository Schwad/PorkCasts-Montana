source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rubocop', require: false
gem 'cancancan', '~> 1.10'
#everyday rails rec cluster.
group :development,:test do
  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails", "~> 4.4.1"
end
gem 'pg'

#Monitoring in development
gem 'rack-mini-profiler', require: false
gem 'flamegraph'
gem 'stackprof'
gem 'fast_stack'

group :test do
  gem "faker"
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end

gem 'twitter'
gem 'bugsnag'
gem 'social-share-button'
gem 'groupdate'
gem "chartkick"
gem "font-awesome-rails"
gem 'jquery-ui-rails'
gem 'taps'
gem 'devise'
gem 'newrelic_rpm'
gem 'soda-ruby', :require => 'soda'
gem 'actionmailer'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem "letter_opener", :group => :development
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'json'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.
# Use Unicorn as the app server
# gem 'unicorn'

gem "brakeman", :require => false

group :development do
  gem 'better_errors'
  gem 'hirb'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'web-console'
end
gem "highcharts-rails", "~> 3.0.0"
gem 'httparty'
gem 'delayed_job_active_record'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'rails_12factor', group: :production
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
ruby "2.2.2"
