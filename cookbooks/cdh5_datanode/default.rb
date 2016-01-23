include_recipe "../cdh5_base/default"

package "hadoop-hdfs-datanode"

service "hadoop-hdfs-datanode" do
  action :disable
end
