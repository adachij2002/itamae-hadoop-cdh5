package "zookeeper-server"

service "zookeeper-server" do
  action :disable
end

node.reverse_merge!({
  'zoo' => {
    'servers' => {
      [0] => node['hostname'] + ":2888:3888",
    },
  },
})

file "/etc/zookeeper/conf/zoo.cfg" do
  action :edit
  block do |content|
    node['zoo']['servers'].each_with_index {|sv, i|
      if content.gsub!("server\.#{i + 1}", "server\.#{i + 1}=#{sv}") == nil then
        content << "server\.#{i + 1}=#{sv}"
      end
    }
  end
end
