include_recipe "../cdh5_conf/default"

service "zookeeper-server" do
  action :start
end

service "hadoop-hdfs-journalnode" do
  action :start
end

execute "hdfs namenode -format" do
  user "hdfs"
  not_if "test -e #{node['hdfs_site']['dfs_namenode_name_dir']}/current/VERSION"
end

execute "hdfs zkfc -formatZK" do
  user "hdfs"
  only_if " zookeeper-client ls #{node['core_site']['ha_zookeeper_parent_znode']}/#{node['core_site']['fs_defaultFS'].gsub(/^hdfs:\/\//, "")} 2>&1 | grep 'Node does not exist'"
end

service "hadoop-hdfs-namenode" do
  action :start
end

service "hadoop-hdfs-zkfc" do
  action :start
end

service "hadoop-hdfs-datanode" do
  action :start
end
