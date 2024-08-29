# frozen_string_literal: true

source "https://rubygems.org"

gem "bootsnap", require: false
gem "good_migrations"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "keycloak-api-rails", "0.12.4"
gem "rails", "~> 7.2.1"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "dotenv", ">= 3.0"
  gem "factory_bot_rails"
end

group :development do
  gem "annotate"
  gem "bundler-audit", require: false
  gem "pgcli-rails"
  gem "rubocop", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", ">= 2.22.0", require: false
end

group :production do
  gem "sidekiq", "~> 7.0"
end

gem "active_model_serializers", "~> 0.10.14"

gem "carrierwave", "~> 3.0"

gem "carrierwave-base64", "~> 2.11"

gem "rack-cors", "~> 2.0"
