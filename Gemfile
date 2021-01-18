# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", "0.23.1"
# gem "decidim-consultations", "0.23.1"
# gem "decidim-initiatives", "0.23.1"
# gem "decidim-templates", "0.23.1"

gem "bootsnap", "~> 1.4"

gem "puma", ">= 4.3.5"
gem "uglifier", "~> 4.1"

gem "faker", "~> 1.9"

gem "wicked_pdf", "~> 1.4"
gem "whenever", require: false
gem "rspec"
gem "sentry-ruby"
gem "sentry-rails"
gem "daemons"
gem "delayed_job_web"
gem "delayed_job_active_record"

group "production" do
  gem "figaro", "~> 1.2"
end

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", "0.23.1"
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
  
  gem "capistrano", "~> 3.15"
  gem 'capistrano-rails-console', require: false
  gem "capistrano-rbenv", "~> 2.2", require: false
  gem "capistrano-bundler", "~> 2.0", require: false
  gem "capistrano-passenger", "~> 0.2.0", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem 'capistrano-figaro-yml', '~> 1.0.2', require: false
  gem 'capistrano-delayed-job', '~> 1.0'
  gem "passenger", "~> 6.0"
end
