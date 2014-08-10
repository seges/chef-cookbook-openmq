#
# Cookbook Name:: openmq
# Recipe:: default
#
# Copyright 2014, Seges
#
# All rights reserved - Do Not Redistribute
#

include_recipe "zip"

src_filename = node[:openmq][:archive_file]
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = node[:openmq][:install_dir]

user node[:openmq][:user] do
  home "#{extract_path}/openmq"
end

group node[:openmq][:group] do
  members [ node[:openmq][:user] ]
end


remote_file src_filepath do
  source node[:openmq][:url]
  owner node[:openmq][:user]
  group node[:openmq][:group]
  mode "0644"
end

zip "extract_openmq" do
  owner node[:openmq][:user]
  group node[:openmq][:group]
  source src_filepath
  path extract_path
  action :extract
end

link "#{extract_path}/openmq" do
  to "#{extract_path}/MessageQueue4_5"
end

