execute "Install CDH5 Repository" do
  command "rpm -Uvh http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm"
  not_if "rpm -q cloudera-cdh-5-0"
end
