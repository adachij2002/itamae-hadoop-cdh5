include_recipe "../cdh5_base/default"

package "hadoop-hdfs-journalnode"

service "hadoop-hdfs-journalnode" do
  action :disable
end
