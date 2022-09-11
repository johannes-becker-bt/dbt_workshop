Willkommen zum dbt Projekt im dbt Workshop[^1]!

### dbt Modell Struktur

*Anmerkung*: Es gibt natürlich immer mehrere Möglichkeiten sein Modell zu strukturieren, die oft Vor- und Nachteile haben.
Eine sehr detaillierte "good practice" findet ihr hier: https://docs.getdbt.com/guides/best-practices/how-we-structure/  
Ein paar persönliche Erfahrungen, die ich mitgeben möchte:  
1. Beispiel klassischer DWH Layer (Genauer Name ist philosophisch)
   * Stage (minimale Transformationen): View (bei Full Load) oder Incremental (bei Delta Load) - hier sollte auch über Snapshots nachgedacht werden (vor oder nach Transformationen...)
   * Core (this is where the magic happens): View (möglich bei wenig Transformationen), Table (wenn es die spätere Performanz erfordert), Incremental (*nur wenn wirklich nötig*)
   * Mart: View (wenn es eine klassische join + renaming Mart Tabelle ist), Table (wenn es die Performanz erfordert, oft gefolgt bei einer Zugriffs-View)
2. Schema und Materializations Definition in der `dbt_project.yml`:   
   Es macht das Leben deutlich einfacher, wenn man viele Dinge auf Ordner Ebene handelt.
   * `+schema` und `+materialized` Definition auf jeden Fall hier
   * wenn in einem Schema zB Views und Tables Leben, in der dbt Modelstruktur auch einen View und Table Ordner anlegen

Der Vorteil bei der ganzen Sache ist, dass ich bei jedem Modell anhand des Ordners in dem es liegt weiß, in welchem Schema es wie materialisiert ist.
Und wenn ich Performanzprobleme habe, kann ich das Modell einfach vom View Ordner in den Table Ordner ziehen.
Das Ergebnis sieht dann zB so aus
```
models:
  dbt_project:
    STAGE:
      CRM:
        +schema: stg_crm 
        +materialized: view
      CLICKSTREAM:
        +schema: stg_stream
        +materialized: incremental
    CORE:
      +schema: core
      VIEW:
        +materialized: view
      TABLE:
        +materialized: table
    MART:
      CRM:
        +schema: mart_crm
        VIEW:
          +materialized: view
        TABLE:
          +materialized: table
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

[^1]:
    Die Ordnerstruktur `dbt_workshop/dbt_workshop` ist auf den ersten Blick verwirrend. Man möchte instinktiv den Hauptordner löschen - oft hat man allerdings schnell auch Skripte im github Projekt, die nicht zu dbt selbst gehören (zB Extract Load, andere Pythonhelper - oder mehrere dbt Projekte).
    Ein normales Projekt hätte also eher eine Ordner Struktur `project_ziel/dbt_aufgabe`.
    Bei uns ist allerdings das Projektziel und die dbt Aufgabe identisch...
    
