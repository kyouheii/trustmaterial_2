source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby "2.7.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem "sass-rails", "~> 6"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'devise'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'omniauth', '~> 1.9.1'
gem 'line-bot-api'
gem "dotenv"
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'activerecord'
gem 'omniauth-line'
gem 'omniauth-rails_csrf_protection'
gem 'googleauth'
gem 'font-awesome-sass', '~> 6.1.0'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'image_processing', '~> 1.2' # 画像サイズの調整
gem 'whenever', require: false
gem 'pdftotext'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# gem 'sqlite3', '~> 1.4.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'cloudinary'

#日本語化する
gem 'rails-i18n'
#画像アップロード（追加）
gem 'carrierwave'
# gem 'cloudinary'
gem 'dotenv-rails'
gem 'rmagick'
#ページネーション機能でしよう
gem 'will_paginate'
# 検索機能
gem 'ransack'
#gem 'sqlite3', '~> 1.4.1'

group :development, :test do
  # gem 'wicked_pdf'
  # gem 'wkhtmltopdf-binary'
  gem 'sqlite3', '~> 1.4.1'
  # gem 'pry-rails', group: [:development, :test]
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 5.0'
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sinatra-contrib' ,require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


