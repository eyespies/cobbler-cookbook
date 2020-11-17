# frozen_string_literal: true

source 'https://rubygems.org'

# After an upgrade in the ChefDK, Generated the current version of each Gem with this snippet:
#
# for g in $(grep "^\s*gem '" Gemfile  | awk '{print $2}' | awk -F\' '{print $2}' | sort -u)  ; do
#   gn=$(printf "$g" | awk '{print $1}')
#   gv=$(gem list | grep "^$g (" | sed 's/.*(\([0-9]*\.[0-9]*\)\..*)/\1/g')
#
#   sed -i.bak "s/^\( *\)gem '$gn'.*$/\1gem '$gn', '~> $gv.0'/g" Gemfile
# done

# NOTE:
# This requires bcrypt_pbkdf and a `chef exec bundle install` may result in the error
# `make: /usr/local/bin/gmkdir: No such file or directory` ... This is fixed by running
# `brew install coreutils`.

group :test do
  gem 'bundler', '~> 1.17.0'
  gem 'gherkin', '~> 5.1.0'
  gem 'minitest', '~> 5.11.0'
  gem 'rake', '~> 12.3.0'
  gem 'simplecov', '~> 0.16.0'
end

group :rake do
  gem 'rake', '~> 12.3.0' # rubocop:disable Bundler/DuplicatedGem
  gem 'tomlrb', '~> 1.2.0'
end

group :lint do
  gem 'foodcritic', '~> 16.2.0'
  gem 'overcommit', '~> 0.46.0'
  gem 'rubocop', '~> 0.75.0'
end

group :unit do
  gem 'berkshelf', '~> 7.0.0'
  gem 'chefspec', '~> 7.4.0'
  gem 'ffi-libarchive', '~> 0.4.10'
end

group :integration do
  gem 'inspec', '~> 4.18.0'
  gem 'kitchen-inspec', '~> 1.3.1'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 2.3.4'
end

group :kitchen_vagrant do
  gem 'kitchen-dokken', '~> 2.8.0'
  gem 'kitchen-ec2', '~> 3.3.0'
  gem 'kitchen-vagrant', '~> 1.6.0'
end

group :development do
  gem 'guard', '~> 2.16.0'
  gem 'guard-foodcritic', '~> 3.0.0'
  gem 'guard-kitchen', '~> 0.0.0'
  gem 'guard-rspec', '~> 4.7.0'
  gem 'guard-rubocop', '~> 1.3.0'
  gem 'rb-fsevent', '~> 0.10.0'
end
