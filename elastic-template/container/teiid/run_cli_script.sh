# Start EAP in admin-only
#nohup $JBOSS_HOME/bin/standalone.sh -c standalone.xml --admin-only &
nohup $JBOSS_HOME/bin/standalone.sh -c standalone-teiid.xml --admin-only &

# Wait for EAP to start
# in wildfly admin port is 9990 
# in eap admin port is 9999

while ! timeout 1 bash -c "echo > /dev/tcp/localhost/9990" 2>/dev/null; do echo "Waiting for admin console..."; sleep 1; done

# Run our CLI script
${JBOSS_HOME}/bin/jboss-cli.sh -c --file=$1

# Stop EAP
jps | grep jboss-modules.jar | awk '{print $1}' |xargs kill
