# System Overview

- [Back to README](../../../README.md)
- [Back to documentation index](../../index.md)

---

This page documents the *Yarns* system so that developers have a general idea of how the system should work.

The [C4](https://c4model.com/) model is used to visualize the higher levels of the architecture.
The system is presented from a high-level perspective, starting with the system's context (level 1) and progressing down to the component level (level 3).
Code diagrams (level 4) are not included in this documentation since they can be difficult to maintain.

## Level 1 - System Context

```mermaid
C4Context
    title [SystemContext] Yarns System
    Person(p_user, "User", "The only human actor of the system")
    System(s_yarns, "Yarns", "The system in development")
    SystemDb_Ext(se_external_dataset, "External Dataset", "Relevant information; Source: Wikipedia")
    Rel(p_user, s_yarns, "uses")
    Rel(s_yarns, se_external_dataset, "integrates data from")
    UpdateLayoutConfig($c4ShapeInRow="1")
```

- The *User*, as expected, is the one using the Yarns application for his own personal use.
- *Yarns* is a web-application that provides all kinds of functionalities related to [yarns](../../../README.md#defining-yarn): view information, rate, create lists, etc.
- The *External Dataset* is the main information source of *Yarns*.
It's a vital element because *Yarns* cannot exist without yarns-related information being present in the system.
With that in mind, a proper information source had to be chosen and Wikipedia was selected (please refer to [Information Source of YarnsDB](./yarnsdb.md#information-source) for the reasoning on this).

## Level 2 - Containers

```mermaid
C4Container
    title [Container] Yarns System Containers
    Person(p_user, "User")
    Boundary(b_yarns_system, "Yarns System", "Software System"){
        Container(cnt_yarns_app, "YarnsApp", "Container: Ionic/Vue and PouchDB", "Provides all core functionality.")
        Container(cnt_yarns_content_server, "YarnsServer", "Container: Python and CouchDB", "Provides content-related functionality.")
    }
    SystemDb_Ext(se_external_dataset, "External Dataset", "Source: Wikipedia")
    Rel(p_user, cnt_yarns_app, "uses")
    Rel(cnt_yarns_app, cnt_yarns_content_server, "communicates with")
    Rel(cnt_yarns_content_server, se_external_dataset, "extracts data from")
```

- The [*YarnsApp*](./application.md) is a [Progressive Web App (PWA)](https://en.wikipedia.org/wiki/Progressive_web_app) built with the Ionic/Vue framework, along with PouchDB as the client-side database (please refer to [Technologies of YarnsApp](./application.md#technologies) for the reasoning on this).
- The [*YarnsServer*](./server.md) is a server (or a group of servers) that provides information to the frontend application.
It's built with Python to extract the desired content and CouchDB as the database engine (please refer to [Technologies of YarnsServer](./server.md#technologies) for the reasoning on this).

## Level 3 - Components

```mermaid
C4Component
    title [Component] Yarns System Components
    Person(p_user, "User")
    Boundary(b_yarns_system, "Yarns System", "Software System"){
        Boundary(b_yarns_app, "YarnsApp", "Container"){
            ComponentDb(cmp_yarns_db_local, "YarnsDB", "Component: PouchDB", "Provides access to Yarns content.")
            Component(cmp_pwa, "PWA", "Component: Ionic/Vue", "A Cross-Platform application.")
            ComponentDb(cmp_user_db, "UserDB", "Component: PouchDB", "Stores user data.")
        }
        Boundary(b_yarns_content_server, "YarnsServer", "Container"){
            Component(cmp_yarns_extractor, "YarnsExtractor", "Component: Python", "External content middleman.")
            ComponentDb(cmp_yarns_db_remote, "YarnsDB", "Component: CouchDB/JSON", "Yarns content source.")
            ComponentDb(cmp_online_user_db, "Online UserDB", "Component: CouchDB/JSON", "UserDB for backup and interconnectivity.")
        }
    }
    SystemDb_Ext(se_external_dataset, "External Dataset", "Source: Wikipedia")
    Rel(p_user, cmp_pwa, "uses")
    Rel(cmp_pwa, cmp_yarns_db_local, "reads from", "JSON")
    Rel(cmp_pwa, cmp_user_db, "reads from and writes to", "JSON")
    Rel(cmp_yarns_extractor, se_external_dataset, "extracts data from", "SPARQL/TCP")
    Rel(cmp_yarns_extractor, cmp_yarns_db_remote, "writes yarns data to", "JSON/HTTPS")
    Rel(cmp_yarns_db_local, cmp_yarns_db_remote, "replicates yarns data from", "JSON/HTTPS")
    Rel(cmp_user_db, cmp_online_user_db, "replicates user data to", "JSON/HTTPS")
```

- *YarnsServer* contains the following components:
  - [*YarnsDB*](./yarnsdb.md): a CouchDB instance that contains the main content of the application, i.e., information regarding all yarns (please refer to [YarnsDB of YarnsServer](./server.md#yarnsdb) for more information);
    - Instead of a CouchDB instance, *YarnsDB* could be represented as JSON files;
  - Online [*UserDB*](./userdb.md): a CouchDB instance that contains personal and private information regarding each user and is a replication of the local database (please refer to [Online UserDB of YarnsServer](./server.md#online-userdb) for more information);
    - Instead of a CouchDB instance, the *Online UserDB* could be represented JSON files.
      However, in this case, the user would only be able to use the functionalities that do not require interaction with other users;
  - [*YarnsExtractor*](./extractor.md): the component responsible for extracting, transforming, and loading content into *YarnsDB* (please refer to [YarnsExtractor of YarnsServer](./server.md#yarnsextractor) for more information);
- *YarnsApp* contains the following components:
  - [*PWA*](./application.md): the frontend application;
  - [*YarnsDB*](./yarnsdb.md): a local replication of the remote *YarnsDB*;
  - [*UserDB*](./userdb.md): a PouchDB instance where user-specific data is stored and, optionally, replicated into an *Online UserDB*

### Deployment

```mermaid
C4Deployment
    title [Deployment] Deployment of Yarns System Components
    Boundary(b_yarns_system, "Yarns System", "Software System"){
        Node(n_yarns_app, "User Device", "DeploymentNode: Android, iOS, Windows, macOS, or Linux"){
            ComponentDb(cmp_yarns_db_local, "YarnsDB", "Component: PouchDB", "Provides access to Yarns content.")
            Component(cmp_pwa, "PWA", "Component: Ionic/Vue", "A Cross-Platform application.")
            ComponentDb(cmp_user_db, "UserDB", "Component: PouchDB", "Stores user data.")
        }
        Node(n_yarns_server, "YarnsServer", "DeploymentNode: Cloud/UserServer/UserDevice"){
            Node(n_yarns_db_container, "YarnsDB Container", "DeploymentNode: Container"){
                ComponentDb(cmp_yarns_db_remote, "YarnsDB", "Component: CouchDB", "Yarns content source.")
            }
            Node(n_yarns_extractor_container, "YarnsExtractor Container", "DeploymentNode: Container"){
                Component(cmp_yarns_extractor, "YarnsExtractor", "Component: Python", "External content middleman.")
            }
            Node(n_online_user_db_container, "Online UserDB Container", "DeploymentNode: Container"){
                ComponentDb(cmp_online_user_db, "Online UserDB", "Component: CouchDB", "UserDB for backup and interconnectivity.")
            }
        }
    }
    Node(n_dataset_provider_server, "DatasetProviderServer", "DeploymentNode: Cloud/ProviderServer"){
        SystemDb_Ext(se_external_dataset, "External Dataset", "Source: Wikipedia")
    }
    Person(p_user, "User")
    Rel(p_user, cmp_pwa, "uses")
    Rel(cmp_pwa, cmp_yarns_db_local, "reads from", "JSON")
    Rel(cmp_pwa, cmp_user_db, "reads from and writes to", "JSON")
    Rel(cmp_yarns_extractor, se_external_dataset, "extracts data from", "SPARQL/TCP")
    Rel(cmp_yarns_extractor, cmp_yarns_db_remote, "writes yarns data to", "JSON/HTTPS")
    Rel(cmp_yarns_db_local, cmp_yarns_db_remote, "replicates yarns data from", "JSON/HTTPS")
    Rel(cmp_user_db, cmp_online_user_db, "replicates user data to", "JSON/HTTPS")
```

- YarnsApp is installed on the user's device and can be used natively by building the PWA into a standalone app.
  It can also be deployed to the cloud and accessed through a web browser.
- YarnsServer is a modular, multi-instance system that allows for flexible deployment options, such as cloud, server, or local device.
  Multiple databases can be set up to provide different types of content and to replicate or backup data.
  YarnsOrg, users, or other organizations can manage these instances, and users can select their preferred one.
