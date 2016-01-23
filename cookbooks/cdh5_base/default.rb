include_recipe "../common/default"
include_recipe "../java/default"
include_recipe "../cdh5_repo/default"

package "hadoop"

include_recipe "../cdh5_conf/default"
