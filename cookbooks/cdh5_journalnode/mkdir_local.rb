include_recipe "../cdh5_base/default"

directory node['hdfs_site']['dfs_journalnode_edits_dir'] do
  mode "700"
  owner "hdfs"
  group "hdfs"
end
