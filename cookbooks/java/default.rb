java_versions = {
  "8u71" => "b15",
  "8u65" => "b17",
  "7u79" => "b15",
}
latest = java_versions.sort.reverse[0]

node.reverse_merge!({
  'java' => {
    'version' => latest[0],
  }
})
java_build_number = java_versions[node['java']['version']]
java_rpm_version = sprintf("1\\.%s\\.0_%s", *node['java']['version'].split("u"))

execute "Download Oracle JDK" do
  command "wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/#{node['java']['version']}-#{java_build_number}/jdk-#{node['java']['version']}-linux-x64.rpm -O /tmp/jdk-#{node['java']['version']}-linux-x64.rpm"
  not_if "test -e /tmp/jdk-#{node['java']['version']}-linux-x64.rpm"
end

execute "Install Oracle JDK" do
  command "rpm -Uvh /tmp/jdk-#{node['java']['version']}-linux-x64.rpm"
  not_if "rpm -qa | grep 'jdk#{java_rpm_version}'"
end

remote_file "/etc/profile.d/java.sh" do
  owner "root"
  group "root"
end
