export TEZ_CONF_DIR=/etc/tez/conf
export TEZ_JARS=/usr/lib/tez/*:/usr/lib/tez/lib/*
export HADOOP_CLASSPATH=${HADOOP_CLASSPATH}:${TEZ_CONF_DIR}:${TEZ_JARS}
