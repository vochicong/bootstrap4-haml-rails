source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap'
gem 'haml-rails'
gem 'high_voltage'
group :development do
  gem 'better_errors'
  gem 'html2haml'
  gem 'rails_layout'
  gem 'erb2haml'
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end
group :test do
  gem 'guard'
  gem 'guard-minitest'
end
group :production do
  gem 'mysql2', '~> 0.3.18'
end
