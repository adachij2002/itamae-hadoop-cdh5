directory node['yarn_site']['yarn_nodemanager_local_dirs'] do
  mode "755"
  owner "yarn"
  group "yarn"
end
directory node['yarn_site']['yarn_nodemanager_log_dirs'] do
  mode "755"
  owner "yarn"
  group "yarn"
end
directory node['yarn_site']['yarn_nodemanager_remote_app_log_dir'] do
  mode "755"
  owner "yarn"
  group "yarn"
  not_if node['yarn_site']['log_aggregation_enable'] == "true"
end
