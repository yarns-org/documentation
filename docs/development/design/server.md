# YarnsServer

- [Back to README](../../../README.md)
- [Back to documentation index](../../index.md)

---

This page documents the YarnsServer.
If you have not yet reviewed the system documentation, please take a look [here](./system.md).

## Table of Contents

- [YarnsServer](#yarnsserver)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [YarnsDB](#yarnsdb)
  - [Online UserDB](#online-userdb)
  - [YarnsExtractor](#yarnsextractor)
  - [Technologies](#technologies)
  - [Development Notes](#development-notes)
  - [Deployment Notes](#deployment-notes)

## Description

The YarnsServer is a server (or a group of servers) that provides information to the frontend application.
It's a modular, multi-instance system that allows for flexible deployment options, such as cloud, server, or local device.
Multiple YarnsDBs can be configured to provide different types of content, and multiple UserDBs can be configured to replicate and back up data.
YarnsOrg, users, or other organizations can manage these instances, and users can select their preferred one.

## YarnsDB

YarnsDB is a CouchDB instance that contains the main content of the application, i.e., information regarding all yarns.
This database is a crucial part of the system: without good quality, fit for use data this application will not meet its purpose.
YarnsDB is also a local instance of a PouchDB database, used for offline-first access.
This database *must* prevent write operations (only YarnsExtractor and administrators should be able to do this).
Please refer to [YarnsDB Content and Schema](./yarnsdb.md) for information regarding the database content and its schema.

## Online UserDB

The Online UserDB contains personal and private information regarding each user.
Here, the user's password or a different password defined by the user is used for the [End-To-End Encryption (E2EE)](https://en.wikipedia.org/wiki/End-to-end_encryption) of the content.
This database is used a) as a backup of user information in case of data corruption, data loss, data migration, etc. and b) for user interconnectivity in some functionalities of the app.
The database *must* allow a) only authenticated operations, and b) the replication of local data from PouchDB to CouchDB.
Please refer to [UserDB Schema](./userdb.md) for information regarding the database schema.

## YarnsExtractor

The YarnsExtractor is the component responsible for extracting content from the external dataset, transforming it, and loading it into YarnsDB.
Please refer to [YarnsContentExtractor](./extractor.md) for more technical information regarding this extractor component.

## Technologies

The YarnsExtractor is built with Python to extract the desired content.
Why Python?
Thats an easy one, because of its versatility, ease of use, and rich ecosystem.
Why CouchDB?
CouchDB is a document-oriented NoSQL database, whose "core concepts are simple (yet powerful) and well understood"[^why_couch_db_relax].
So what are CouchDB's core concepts?

- **Relaxation**: CouchDB simplifies the job of the developer on various fronts[^why_couch_db_relax];
- **Web-based**: CouchDB is "built of the Web"[^why_couch_db_model_data], fully embracing HTTP and the REST architectural style;
- **Data arrangement**: being document-oriented, CouchDB fully embraces the evolution and self-contention of data, allowing for a more fluid development as requirements on change over time;
- **Eventual consistency**: by gracefully allowing the replication of data across distributed nodes[^why_couch_db_replication], CouchDB's answer to the [CAP theorem](https://en.wikipedia.org/wiki/CAP_theorem) is to provide [eventual consistency](https://en.wikipedia.org/wiki/Eventual_consistency), and, as a consequence, a highly available and partition tolerant environment[^couchdb_consistency];
- **Offline support**: by providing eventual consistency, CouchDB's replication mechanism allows for data to be synchronized while having a high-level latency [^why_couch_db_local_data_is_king], allowing one to develop applications that respect the [offline-first](https://offlinefirst.org/) principles.

## Development Notes

- Check out PouchDB's [CouchDB authentication recipes](https://github.com/pouchdb-community/pouchdb-authentication/blob/master/docs/recipes.md) for common authentication use cases.

## Deployment Notes

- Deploying CouchDB into the cloud can be tricky, but can be done using [Bitnami](https://bitnami.com/)
  - Please refer to [^bitnami_couchdb] on how to deploy "CouchDB packaged by Bitnami" into the cloud.
- Alternatively, [Cloudant](https://www.ibm.com/products/cloudant) can be used as a cloud-native, Database-as-a-service alternative to CouchDB
  - Please refer to [^cloudant_cloudant_vs_couchdb] and [^cloudant_cloudant_api_vs_couchdb_api] for a comparison between CouchDB and Cloudant.

[^bitnami_couchdb]: <https://bitnami.com/stack/couchdb>
[^cloudant_cloudant_api_vs_couchdb_api]: <https://cloud.ibm.com/docs/Cloudant?topic=Cloudant-comparison-of-ibm-cloudant-and-couchdb-api-endpoints>
[^cloudant_cloudant_vs_couchdb]: <https://cloud.ibm.com/docs/Cloudant?topic=Cloudant-couchdb-and-cloudant>
[^couchdb_consistency]: <https://docs.couchdb.org/en/stable/intro/consistency.html> (last visited on 2023-10-05)
[^why_couch_db_local_data_is_king]: <https://docs.couchdb.org/en/stable/intro/why.html#local-data-is-king> (last visited on 2023-10-03)
[^why_couch_db_model_data]: <https://docs.couchdb.org/en/stable/intro/why.html#a-different-way-to-model-your-data> (last visited on 2023-10-05)
[^why_couch_db_relax]: <https://docs.couchdb.org/en/stable/intro/why.html#relax> (last visited on 2023-10-03)
[^why_couch_db_replication]: <https://docs.couchdb.org/en/stable/intro/why.html#couchdb-replication> (last visited on 2023-10-05)
