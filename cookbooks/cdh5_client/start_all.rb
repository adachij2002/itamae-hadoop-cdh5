service "zookeeper-server" do
  action :start
end

service "hadoop-hdfs-journalnode" do
  action :start
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

service "hadoop-yarn-resourcemanager" do
  action :start
end

service "hadoop-yarn-nodemanager" do
  action :start
end
