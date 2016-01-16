# Java
export JAVA_HOME=/usr/java/default

if ! echo ${PATH} | /bin/grep -q ${JAVA_HOME}/bin ; then
   export PATH=${JAVA_HOME}/bin:${PATH}
fi
