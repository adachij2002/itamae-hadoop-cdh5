service "hadoop-yarn-resourcemanager" do
  action :stop
end

service "hadoop-yarn-nodemanager" do
  action :stop
end

service "hadoop-hdfs-zkfc" do
  action :stop
end

service "hadoop-hdfs-namenode" do
  action :stop
end

service "hadoop-hdfs-datanode" do
  action :stop
end

service "hadoop-hdfs-journalnode" do
  action :stop
end

service "zookeeper-server" do
  action :stop
end
