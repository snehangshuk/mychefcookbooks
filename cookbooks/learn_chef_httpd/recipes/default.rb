#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'httpd'
package 'php'
service 'httpd' do
  supports :restart => true, :reload => true
  action :enable
end

#template '/var/www/html/index.html' do
# source 'index.html.erb'
#end
#
# Using less.zip from s3
#
#remote_file "#{Chef::Config[:file_cache_path]}/less.zip" do
#  source "http://snehang-assets.s3.amazonaws.com/less.zip"
#end

src_filename = 'less.zip'
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "/var/www/html/"

bash 'extract_module' do
 # cwd ::File.dirname(src_filepath)
  code <<-EOH
    cd #{extract_path}
    rm -rf *
    wget http://snehang-assets.s3.amazonaws.com/less.zip
    unzip #{src_filename}
    EOH
end
