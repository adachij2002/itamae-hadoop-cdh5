include_recipe "../cdh5_base/default"

package "hadoop-yarn-resourcemanager"

service "hadoop-yarn-resourcemanager" do
  action :disable
end
