# encoding: utf-8
# frozen_string_literal: true

name             'cobblerd'
maintainer       'Compute Architecture'
maintainer_email 'compute@bloomberg.net'
license          'Apache-2.0'
description      'Installs/Configures cobblerd'
long_description 'Installs/Configures cobblerd'
version          '1.0.6'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/eyespies/cobbler-cookbook/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
source_url 'https://github.com/eyespies/cobbler-cookbook' if respond_to?(:source_url)

depends 'apt', '~> 7.2.0'
# For RHEL 7 and later platforms
depends 'nginx', '~> 10.6'
depends 'poise'
depends 'yum-epel'

%w[centos redhat].each do |name|
  supports name, '~> 8.0'
end

# Requires at least 12.11 (due to introduction of systemd_unit) but we make it 12.19 which includes updates
# to systemd_unit.
chef_version '>= 15' if respond_to?(:chef_version)
