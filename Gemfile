source "https://rubygems.org"

ruby "2.1.5"

gem "coffee-rails", "~> 4.1.0"
gem "foundation-rails"
gem "jquery-rails"
gem "omniauth-github"
gem "omniauth-launch-pass",
  github: "LaunchAcademy/omniauth-launch-pass"
gem "pg"
gem "rails", "4.2.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "airbrake"

group :development do
  gem "launchcop",
    github: "LaunchAcademy/launchcop"
end

group :development, :test do
  gem "capybara"
  gem "dotenv-rails"
  gem "factory_girl_rails", "~> 4.0"
  gem "launchy"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.0"
  gem "shoulda-matchers"
  gem "valid_attribute"
end

group :production do
  gem "rails_12factor"
end
