include_recipe "../common/default"
include_recipe "../java/default"
include_recipe "../cdh5_repo/default"

package "hadoop"

remote_directory "/etc/hadoop/conf.cluster" do
  source "files/etc/hadoop/conf.cluster"
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
