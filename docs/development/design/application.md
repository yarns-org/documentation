# YarnsApp (Frontend Application)

- [Back to README](../../../README.md)
- [Back to documentation index](../../index.md)

---

This page documents the frontend application of Yarns.
If you have not yet reviewed the system documentation, please take a look [here](./system.md).

## Table of Contents

- [YarnsApp (Frontend Application)](#yarnsapp-frontend-application)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Technologies](#technologies)

## Description

YarnsApp is a Progressive Web App (PWA) that makes used of PouchDB as the client-side database.
The app is intended to be a standalone mobile application.
However, release artifacts for all relevant operating systems are provided.
This includes Android, iOS, Linux, MacOS, and Windows.

A conscious decision was made to provide the application in English only.
The reason for this is that the primary source of information (i.e., Wikipedia) is most complete in English, and many articles do not exist in other languages.
This may be addressed in the future when a good solution to this problem is found, but not in the meantime.

## Technologies

As previously referred, YarnsApp is a PWA.
Why a PWA?
Because PWAs are built using web technologies, and can be either deployed into the cloud or installed on devices[^mozilla_what_is_pwa].
They have a single codebase and offer numerous benefits[^web_dev_pwa], such as ubiquity, easy access, high performance, easy deploy/update, standalone operation, offline operation, and OS integration.

The Ionic/Vue framework combination was chosen to create the PWA.
Ionic is "an open source UI toolkit for building performant, high-quality mobile apps using web technologies"[^ionic_docs].
It allows allows the integration of other popular frameworks, such is the likes of [Vue](https://vuejs.org/), which has been chosen over Angular and React because it is a) "an independent, community-driven project", b) reliable, c) fast, and d) lightweight [^vue_faq].

Besides Ionic and Vue, PouchDB is also used as the client-side database.
It is based on CouchDB, and allows applications to save data locally while offline and then synchronize it with remote CouchDB-compatible instances when necessary[^pouchdb_learn].
This is essential for Yarns if it wants to provide an offline-first experience.

[^ionic_docs]: <https://ionicframework.com/docs> (last visited on 2023-10-06)
[^mozilla_what_is_pwa]: <https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/What_is_a_progressive_web_app> (last visited on 2023-10-06)
[^pouchdb_learn]: <https://pouchdb.com/learn.html> (last visited on 2023-10-06)
[^vue_faq]: <https://vuejs.org/about/faq> (last visited on 2023-10-06)
[^web_dev_pwa]: <https://web.dev/learn/pwa/progressive-web-apps/> (last visited on 2023-10-06)
