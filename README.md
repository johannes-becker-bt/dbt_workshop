# dbt_workshop
Willkommen beim dbt Workshop für (leicht) Fotgeschrittene. 
Die Annahme bei diesem Workshop ist, dass zum Beispiel erste Schritte im Workflow mit `dbt run` und `dbt test` bereits bekannt sind. Außerdem wird vorausgesetzt, dass man ungefähr weiß, was das `profiles.yml` und `dbt_project.yml` machen. 
Themen, die bei diesem Workshop behandelt werden sollen sind:  
1. *macros*: Jinja Macros sind ein zentrales Feature von dbt und erweitern stark die Möglichkeiten, die man durch SQL im ELT-Prozess hat  
2. *incremental*: Incremental Loads haben zum Beispiel Performanz-Vorteile gegenüber Full Loads, kommen aber auch mit zusätzlichen Anforderungen zu Design-Fragen und Komplexität  
## Installation
*ACHTUNG* Das Projekt ist ein Work in Progress und es kann nicht garantiert werden, dass die Installation immer 100%ig funktioniert.  
Zum entwickeln wird gerade eine sqlite "Datenbank" genutzt. Das Repo enthält ein environment, insofern kann man zur anstelle einer Installation auch  
`source env_dbt_ws/bin/activate`  
nutzen. Alternativ wäre die Lösung
```
pip install dbt-core
pip install dbt-sqlite
```
Der Inhalt des `.profiles.yml` wäre in etwa
```
dbt_workshop:

  target: dev
  outputs:
    dev:
      type: sqlite

      # sqlite locks the whole db on writes so anything > 1 won't help
      threads: 1

      # value is arbitrary
      database: "database"

      # value of 'schema' must be defined in schema_paths below. in most cases,
      # this should be 'main'
      schema: 'main'

      # connect schemas to paths: at least one of these must be 'main'
      schemas_and_paths:
        main: 'data/etl.sqlite3'
        A1_FAKE_STAGE: 'data/A1_FAKE_STAGE.sqlite3'

      # directory where all *.db files are attached as schema, using base filename
      # as schema name, and where new schema are created. this can overlap with the dirs of
      # files in schemas_and_paths as long as there's no conflicts.
      schema_directory: 'data'

```
