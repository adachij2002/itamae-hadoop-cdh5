include_recipe "../../cookbooks/cdh5_namenode/default"
include_recipe "../../cookbooks/cdh5_datanode/default"
include_recipe "../../cookbooks/cdh5_journalnode/default"
include_recipe "../../cookbooks/cdh5_resourcemanager/default"
include_recipe "../../cookbooks/cdh5_nodemanager/default"
include_recipe "../../cookbooks/cdh5_client/default"

include_recipe "../../cookbooks/cdh5_conf/default"
