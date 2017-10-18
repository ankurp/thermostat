source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'execjs'
gem 'therubyracer', platforms: :ruby

gem 'elasticsearch-model', '~> 0.1.9'
gem 'elasticsearch-rails', '~> 0.1.9'
gem 'elasticsearch-persistence', '~> 0.1.9'
gem 'elasticsearch-xpack'
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'
gem 'devise', '~> 4.2.0'
gem 'mysql2', '~> 0.4.5', platform: :ruby
gem 'twilio-ruby', '~> 4.13.0'

