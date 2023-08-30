source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "active_model_serializers", "~> 0.10.0"
gem "aws-sdk-s3", "~> 1.123"
gem "bcrypt", "~> 3.1", ">= 3.1.18"
gem "bootsnap", require: false
gem "image_processing", "~> 1.12"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "stripe", "~> 9.0"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem "pry"
end

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
end
