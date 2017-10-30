FROM docker.elastic.co/logstash/logstash:5.6.3

RUN bin/logstash-plugin install logstash-input-jdbc
RUN curl -O https://jdbc.postgresql.org/download/postgresql-42.1.4.jar
RUn curl -O https://repository.jboss.org/nexus/service/local/repositories/releases/content/org/jboss/teiid/teiid/9.3.4/teiid-9.3.4-jdbc.jar
