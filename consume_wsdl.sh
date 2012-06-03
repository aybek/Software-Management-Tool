rm src/ws_package/*.java
/opt/jboss-5.1.0.GA-jdk6/jboss-5.1.0.GA/bin/wsconsume.sh -k -p ws_package -s src -o bin http://127.0.0.1:8080/project_ws/user?wsdl
echo ok
