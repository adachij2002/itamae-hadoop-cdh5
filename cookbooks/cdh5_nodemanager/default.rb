include_recipe "../cdh5_base/default"

package "hadoop-yarn-nodemanager"

service "hadoop-yarn-nodemanager" do
  action :disable
end
