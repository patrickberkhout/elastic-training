# Loading data into elastic using the database importer.

## Startup the logstash, elasticsearch, teiid and postgres containers
 	docker-compose up -d --build kibana

## Configure the pipeline in elastic that will parse pdf content. 
### Log into kibana <http://localhost:5601/> 
* Username: elastic
* Password: changeme

Goto the DevTools section and run:

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

## Run the logstash containers
This will trigger the database upload as well.

		docker-compose up -d --build logstash_pdf
		docker-compose up -d --build logstash_products

## Checkout the 'pdf' index in elastic
<http://localhost:9200/pdf/_search?pretty>

* Username: elastic
* Password: changeme

## Search entries in kibana
Log into kibana <http://localhost:5601/>  and add `p*` as index pattern. Then perform your search.

## Command line actions
	
Get all pdf's

	curl -u elastic:changeme -XGET 'http://localhost:9200/pdf/_search?pretty' -d ' { "query": { "match_all": {} } }'

Get all products

	curl -u elastic:changeme -XGET 'http://localhost:9200/products/_search?pretty' -d ' { "query": { "match_all": {} } }'

Delete index when needed...

	curl -u elastic:changeme -XDELETE 'http://localhost:9200/pdf' 
	curl -u elastic:changeme -XDELETE 'http://localhost:9200/products' 




REf:
<https://www.elastic.co/blog/logstash-jdbc-input-plugin>

