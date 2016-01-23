directory node['hdfs_site']['dfs_namenode_name_dir'] do
  mode "700"
  owner "hdfs"
  group "hdfs"
end
