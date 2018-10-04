source 'https://rubygems.org'

# After an upgrade in the ChefDK, Generated the current version of each Gem with this snippet:
#
# for g in $(grep "^\s*gem '" Gemfile  | awk '{print $2}' | awk -F\' '{print $2}' | sort -u)  ; do
#   gn=$(printf "$g" | awk '{print $1}')
#   gv=$(gem list | grep "^$g (" | sed 's/.*(\([0-9]*\.[0-9]*\)\..*)/\1/g')
#
#   sed -i.bak "s/^\( *\)gem '$gn'.*$/\1gem '$gn', '~> $gv.0'/g" Gemfile
# done

gem 'aws-sdk', '~> 2.11.0'
gem 'inspec', '~> 2.2.0'

group :test do
  gem 'bundler', '~> 1.16.0'
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
  gem 'foodcritic', '~> 14.0.0'
  gem 'overcommit', '~> 0.46.0'
  gem 'rubocop', '~> 0.55.0'
end

group :unit do
  gem 'berkshelf', '~> 7.0.0'
  gem 'chefspec', '~> 7.2.0'
  gem 'ffi-libarchive', '~> 0.4.0'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.23.0'
end

group :kitchen_vagrant do
  gem 'kitchen-docker', '~> 2.7.0'
  gem 'kitchen-dokken', '~> 2.6.0'
  gem 'kitchen-vagrant', '~> 1.3.0'
end

group :development do
  gem 'growl', '~> 1.0.0'
  gem 'guard', '~> 2.14.0'
  gem 'guard-foodcritic', '~> 3.0.0'
  gem 'guard-kitchen', '~> 0.0.0'
  gem 'guard-rspec', '~> 4.7.0'
  gem 'guard-rubocop', '~> 1.3.0'
  gem 'rb-fsevent', '~> 0.10.0'
  gem 'ruby_gntp', '~> 0.3.0'
end
