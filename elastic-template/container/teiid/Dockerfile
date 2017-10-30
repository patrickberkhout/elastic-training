FROM teiid/teiid:9.3.4

WORKDIR teiid-9.3.4
RUN bin/add-user.sh -s -a -g user,odata -u teiid -p teiid -e
COPY example-phonetic-secure-vdb.xml standalone/deployments
COPY pdf-vdb.xml standalone/deployments

COPY run_cli_script.sh .
COPY file_datasource.cli .
RUN bash run_cli_script.sh file_datasource.cli 

# http://stackoverflow.com/questions/20965737/
RUN rm -rf standalone/configuration/standalone_xml_history/current
