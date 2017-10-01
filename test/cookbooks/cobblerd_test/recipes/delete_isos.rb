#
# Cookbook Name:: cobblerd_test
# Recipe:: create_distros
#
# Copyright 2017, Justin Spies <justin@thespies.org>
#
# All rights reserved - Do Not Redistribute
#
# It is not automatically started.

# Only delete the one ISO (7.3) so that a review of the web UI allows developers to see that 6.9 was downloaded
# and created.
%w[6.9].each do |vers|
  osmajor = vers.gsub(/\.[0-9].*/, '')

  if osmajor == '7'
    release = vers.gsub(/[0-9]*\.[0-9]*\.([0-9]*)/, '\1')
    source_file = "CentOS-#{osmajor}-x86_64-DVD-#{release}.iso"
  else
    source_file = "CentOS-#{vers}-x86_64-bin-DVD1.iso"
  end

  # The distros are dependent on the ISO having been downloaded.
  cobblerd_iso "centos-#{vers}-netinstall" do
    source "http://mirrors.kernel.org/centos/#{vers}/isos/x86_64/#{source_file}"
    target "/var/www/cobbler/isos/#{source_file}"
    action :delete
  end
end
