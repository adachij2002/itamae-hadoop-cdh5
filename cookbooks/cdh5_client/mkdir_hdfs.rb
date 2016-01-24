# HDFS directories
execute "hdfs dfs -chmod 755 /" do
  user "hdfs"
end

execute "hdfs dfs -mkdir /tmp" do
  user "hdfs"
end

execute "hdfs dfs -chown hdfs:hadoop /tmp" do
  user "hdfs"
end

execute "hdfs dfs -chmod -R 1777 /tmp" do
  user "hdfs"
end

execute "hdfs dfs -mkdir -p /user/hdfs" do
  user "hdfs"
end

execute "hdfs dfs -chown hdfs /user/hdfs" do
  user "hdfs"
end

# YARN HDFS directories
execute "hdfs dfs -mkdir -p /hadoop-yarn/staging" do
  user "hdfs"
end

execute "hdfs dfs -chmod -R 1777 /hadoop-yarn/staging" do
  user "hdfs"
end

execute "hdfs dfs -chown mapred:hadoop /hadoop-yarn/staging" do
  user "hdfs"
end
