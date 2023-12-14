# YarnsContentExtractor

- [Back to README](../../../README.md)
- [Back to documentation index](../../index.md)

---

This page documents the YarnsExtractor.
If you have not yet reviewed the system documentation, please take a look [here](./system.md).

## Table of Contents

- [YarnsContentExtractor](#yarnscontentextractor)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Wikipedia](#wikipedia)
    - [Possible Yarn Types](#possible-yarn-types)

## Description

The YarnsExtractor is the component responsible for extracting content from the external dataset (i.e., Wikipedia), and loading it into YarnsDB.
Content is integrated through [batch processing](https://aws.amazon.com/what-is/batch-processing/), while making use of an [ETL](https://en.wikipedia.org/wiki/Extract,_transform,_load) process where data is:

1. Extracted through Wikidata's SPARQL query service
2. Transformed, filtered, mapped, and validated
3. Loaded into Yarns through the REST API inherent to a CouchDB database

## Wikipedia

This section describes how data can be properly extracted from Wikipedia.

Before proceeding further, it is important to define two key terms: Wikipedia and Wikidata.
Wikipedia is an encyclopedic website that is written for humans.
It is a collaborative effort where anyone can contribute to and edit the content.
On the other hand, Wikidata is a database designed to be used by both humans and programs, in a multilingual way.
It acts as a central storage repository for structured data of Wikimedia projects, including Wikipedia.

> [!WARNING]
> This section serves only as a mere guide for extracting content from Wikipedia.
> It's not definitive and is subject to future modifications.

All items that are an instance of a Wikidata item can be extracted using the SPARQL service at <https://query.wikidata.org/>.
For example, one can extract all films using the following query:

```sparql
SELECT ?film ?filmLabel ?article WHERE {
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en". }
  ?film wdt:P31 wd:Q11424.
  OPTIONAL {
    ?article schema:about ?film;
      schema:inLanguage "en";
      schema:isPartOf <https://en.wikipedia.org/>.
  }
}
LIMIT 100
```

Then, the Wikipedia textual content needs to be extracted.
There are two options: the [MediaWiki REST API](https://www.mediawiki.org/wiki/Special:MyLanguage/API:REST_API) and the [MediaWiki Action API](https://www.mediawiki.org/wiki/Special:MyLanguage/API:Main_page).
The REST API provides the raw textual information along with the license (which we must be published along the Wikipedia textual information).
Using this option requires a lot of textual processing.
On the other hand, the MediaWiki Action API enables the retrieval of parsed textual content through the use of the [TextExtracts](https://www.mediawiki.org/wiki/Extension:TextExtracts) extension.
Here are two examples:

- REST API: <https://en.wikipedia.org/w/rest.php/v1/page/The_Godfather>
- MediaWiki Action API: <https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&explaintext&titles=The_Godfather>

### Possible Yarn Types

Possible Yarn Types can be found through the Wikipedia category [works by year](https://en.wikipedia.org/wiki/Category:Works_by_year) that contains all works registered into Wikipedia divided by year and then by subcategory.
Examples include:

- Films
- Short Films
- TV Series
- Telenovelas
- Anime
- Documentaries
- Books
- Short Stories
- Poems
- Comics
- Manga
- Essays
