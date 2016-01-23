include_recipe "../cdh5_base/default"

package "hadoop-hdfs-namenode"
package "hadoop-hdfs-zkfc"

service "hadoop-hdfs-namenode" do
  action :disable
end
service "hadoop-hdfs-zkfc" do
  action :disable
end
