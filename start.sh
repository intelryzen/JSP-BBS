 #!/bin/bash
 mkdir -p /workspace/jsptest/WEB-INF/classes
javac -encoding UTF-8 -cp "$(find /workspace/jsptest/WEB-INF/lib/ -name *.jar -printf %p:)" -d /workspace/jsptest/WEB-INF/classes -g $(find /workspace/jsptest/WEB-INF/src/ -name *.java)
docBase=$(sed 's/\//\\\//g' <<< /workspace/jsptest)
 grep "<Context.*" $CATALINA_HOME/conf/server.xml
 sed -i "s/docBase=\".*\"/docBase=\"$docBase\" reloadable=\"true\"/g" $CATALINA_HOME/conf/server.xml || sed -i "s/<\/Host>/<Context path=\"\" docBase=\"$docBase\" reloadable=\"true\" \/><\/Host>/g" $CATALINA_HOME/conf/server.xml && java -classpath "$(find /workspace/jsptest/WEB-INF/lib/ -name *.jar -printf %p:)$CATALINA_HOME/bin/bootstrap.jar:$CATALINA_HOME/bin/tomcat-juli.jar" -Dcatalina.base=$CATALINA_HOME -Dcatalina.home=$CATALINA_HOME -Djava.io.tmpdir=$CATALINA_HOME/temp org.apache.catalina.startup.Bootstrap start