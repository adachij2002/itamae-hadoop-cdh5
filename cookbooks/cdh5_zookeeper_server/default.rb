package "zookeeper-server"

service "zookeeper-server" do
  action :disable
end

node.reverse_merge!({
  'zoo' => {
    'servers' => [node['hostname'] + ":2888:3888"],
  },
})

file "/etc/zookeeper/conf/zoo.cfg" do
  action :edit
  block do |content|
    node['zoo']['servers'].each_with_index {|sv, i|
      if !content.gsub!(/(server\.#{i + 1})\s*\=\s*.*/, "\\1=#{sv}") then
        content << "server\.#{i + 1}=#{sv}\n"
      end
    }
  end
end

node['zoo']['servers'].each_with_index {|sv, i|
  if sv.include?(node['hostname']) then
    execute "service zookeeper-server init --myid=#{i + 1} --force" do
      not_if "test -e /var/lib/zookeeper/myid"
    end
  end
}
