# elastic: importing pdf

 	docker-compose up -d --build

# Elastic console

http://localhost:9200
Username: elastic
Password: changeme

# Kibana  console

http://localhost:5601/ 

# Configure our pdf pipeline. 
# Goto to Dev Tools and run:
PUT _ingest/pipeline/pdf
{
  "description" : "Extract attachment information",
  "processors" : [
    {
      "attachment" : {
        "field" : "content",
        "indexed_chars" :"-1"
      }
    }
  ]
}

# Restart logstash
docker-compose up -d --build logstash_pdf
docker-compose up -d --build logstash_products



# Go to the kibana console again and add pdf* as index pattern

# Browse pwdf index
curl -u elastic:changeme -XGET 'http://localhost:9200/pdf/_search?pretty' -d ' { "query": { "match_all": {} } }'

# Delete index when needed...
curl -u elastic:changeme -XDELETE 'http://localhost:9200/pdf' 



REf:
https://www.elastic.co/blog/logstash-jdbc-input-plugin

