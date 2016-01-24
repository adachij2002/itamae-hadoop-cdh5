node.reverse_merge!({
  'hadoop_conf' => {
    'name'                                     => "conf.default",
  },
  'core_site' => {
    'fs_defaultFS'                             => "hdfs://nn-cluster",
    'ha_zookeeper_quorum'                      => node['hostname'] + ":2181",
    'ha_zookeeper_parent_znode'                => "/hadoop-ha",
  },
  'hdfs_site' => {
    'dfs_namenode_shared_edits_dir'            => "qjournal://" + node['hostname'] + ":8485/nn-cluster",
    'dfs_namenode_rpc_address_nn_cluster_nn1'  => node['hostname'] + ":8020",
    'dfs_namenode_rpc_address_nn_cluster_nn2'  => node['hostname'] + ":8021",
    'dfs_namenode_http_address_nn_cluster_nn1' => node['hostname'] + ":5070",
    'dfs_namenode_http_address_nn_cluster_nn2' => node['hostname'] + ":5071",
  },
  'mapred_site' => {
    'mapreduce_jobhistory_address'             => node['hostname'] + ":10020",
    'mapreduce_jobhistory_webapp_address'      => node['hostname'] + ":19888",
  },
  'yarn_site' => {
    'yarn_resourcemanager_hostname_rm1'                             => node['hostname'],
    'yarn_resourcemanager_hostname_rm2'                             => node['hostname'],
    'yarn_resourcemanager_address_rm1'                              => node['hostname'] + ":8032",
    'yarn_resourcemanager_address_rm2'                              => node['hostname'] + ":18032",
    'yarn_resourcemanager_webapp_address_rm1'                       => node['hostname'] + ":8088",
    'yarn_resourcemanager_webapp_address_rm2'                       => node['hostname'] + ":18088",
    'yarn_nodemanager_hostname'                                     => node['hostname'],
    'yarn_nodemanager_linux_container_executor_cgroups_mount_path'  => "/cgroup",
    'yarn_nodemanager_linux_container_executor_cgroups_hierarchy'   => "/hadoop-yarn",
    'yarn_log_server_url'                                           => "http://" + node['hostname'] + ":19888/jobhistory/logs/",
    'yarn_timeline_service_hostname'                                => node['hostname'],
    'yarn_resourcemanager_zk_address'                               => node['hostname'] + ":2181",
  },
})

remote_directory "/etc/hadoop/" + node['hadoop_conf']['name'] do
  source "files/etc/hadoop/conf"
  owner "root"
  group "root"
end

file "/etc/hadoop/" + node['hadoop_conf']['name'] + "/container-executor.cfg" do
  mode "644"
  owner "root"
  group "root"
end

execute "alternatives install" do
  command "alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/" + node['hadoop_conf']['name'] + " 50"
  not_if "ls -l /etc/alternatives/hadoop-conf | grep -F '" + node['hadoop_conf']['name'] + "'"
end

execute "alternatives set" do
  command "alternatives --set hadoop-conf /etc/hadoop/" + node['hadoop_conf']['name']
  not_if "ls -l /etc/alternatives/hadoop-conf | grep -F '" + node['hadoop_conf']['name'] + "'"
end

template "/etc/hadoop/conf/core-site.xml" do
  mode "644"
end
template "/etc/hadoop/conf/hdfs-site.xml" do
  mode "644"
end
template "/etc/hadoop/conf/mapred-site.xml" do
  mode "644"
end
template "/etc/hadoop/conf/yarn-site.xml" do
  mode "644"
end
