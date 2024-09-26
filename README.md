# Paper-storage
The project of data base storage for scientific papers.

## Motivation
Many research teams have plenty of papers, accumulated over the years. Usually that papers have various quartiles and so not all of them are indexed by services like Google Scholar. However, the paper storage system is necessary for a more thorough literature search and efficient research work.

## Functionality
* Server Database containing papers with all related information such as:
	* Title
	* Authors
	* Type: journal/conference
	* Name of journal/conference
	* Page or article No in journal/reports collection
	* Date of publication/presentation
	* DOI
	* Keywords
	* Journal/conference quartile/level
	* Acknowledgement
	* Link to repository with sources
	* Download link for paper PDF
	* ...

* The repository is supposed to be searchable by name with filters on all available attributes. 
* The interaction takes place through a web client on the server.
* Main reference - Google Scholar service.

## Framework Stack
* Flask for web service
* Postgres for database