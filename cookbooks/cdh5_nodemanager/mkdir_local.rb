include_recipe "../cdh5_base/default"

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
directory node['yarn_site']['yarn_nodemanager_linux_container_executor_cgroups_mount_path'] + "/cpu" do
  owner "yarn"
  group "yarn"
  only_if node['yarn_site']['yarn_nodemanager_linux_container_executor_cgroups_mount'] == "true"
end
