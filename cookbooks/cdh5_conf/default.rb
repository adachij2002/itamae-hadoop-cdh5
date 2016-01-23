node.reverse_merge!({
  'core_site' => {
    'fs_defaultFS' => 'hdfs://nn-cluster',
    'ha_zookeeper_quorum' => node['hostname'] + ":2181",
  }
})

remote_directory "/etc/hadoop/conf.cluster" do
  source "files/etc/hadoop/conf.cluster"
  owner "root"
  group "root"
end

template "/etc/hadoop/conf.cluster/core-site.xml"

execute "alternatives install" do
  command "alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cluster 50"
  not_if "ls -l /etc/alternatives/hadoop-conf | grep 'conf\\.cluster'"
end

execute "alternatives set" do
  command "alternatives --set hadoop-conf /etc/hadoop/conf.cluster"
  not_if "ls -l /etc/alternatives/hadoop-conf | grep 'conf\\.cluster'"
end
