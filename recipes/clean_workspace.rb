#
# Cookbook Name:: delivery_build
# Recipe:: clear_cache
#
# Copyright 2016 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
memory_mb = node['memory']['total'].gsub(/kB$/i, '').to_i / 1024
if memory_mb < node['delivery_build']['workspace_limit'].to_i
  directory node['delivery_build']['root'] do
    recursive true
    action :delete
  end

  include_recipe 'delivery_build'
end
