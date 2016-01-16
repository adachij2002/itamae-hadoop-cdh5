java_version = "8u65"
java_build_number = "b17"
java_rpm_version = sprintf("1\\.%s\\.0", java_version[0])

execute "Download Oracle JDK" do
  command "wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/#{java_version}-#{java_build_number}/jdk-#{java_version}-linux-x64.rpm -O /tmp/jdk-#{java_version}-linux-x64.rpm"
  not_if "test -e /tmp/jdk-#{java_version}-linux-x64.rpm"
end

execute "Install Oracle JDK" do
  command "rpm -Uvh /tmp/jdk-#{java_version}-linux-x64.rpm"
  not_if "rpm -qa | grep 'jdk#{java_rpm_version}'"
end

remote_file "/etc/profile.d/java.sh" do
  owner "root"
  group "root"
end
