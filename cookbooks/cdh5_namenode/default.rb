include_recipe "../cdh5_base/default"

package "hadoop-hdfs-namenode"

service "hadoop-hdfs-namenode" do
  action :disable
end
