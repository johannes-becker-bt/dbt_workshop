/* 
Die Forscher merken, dass es vielleicht sinnvoller wäre, den Zustand der Pinguine in der Tabelle mit einem zusätzlichen Zeitstempel zu speichern.
Man will ja auch wissen, wann die Pinguine glücklich sind.
Aufgabe:
1. Betrachte das Makro current_timestamp: Das Makro current_timestamp existiert bereits in dbt_utils. 
https://github.com/dbt-labs/dbt-utils/blob/main/macros/cross_db_utils/current_timestamp.sql
Die Idee hier ist, dass es eine default Implementierung gibt (default__curent_timestamp) und man dann für unterschiedliche SQL Flavors einen Adapter schreiben kann.
Als Beispiel gibt es im Ordner macros den Adapter sqlite__curent_timestamp
2. SPÄTER: Nutze diese Stage Tabelle in einer weiteren Tabelle mit Incremental Load.
Beachte, dass der Incremental Load hier einen unique_key aus zwei Spalten benötigt.
*/
SELECT 
    {{create_key(['penguin_island_id','island'])}} as business_key,
    *,
    CASE WHEN RANDOM()<0 THEN 0 ELSE 1 END as is_the_penguin_happy,
    abs(RANDOM() % 2)+1 as scientist_id, -- Fake-id des Wissenschaftlers auf der Insel 
    abs(RANDOM() % 4)+1 as assistant_id, -- Fake-id des Assistenten auf der Insel
    {{current_timestamp()}} as observation_ts
FROM {{ref('seed_penguins')}}
-- Die Forscher analysieren nicht jeden Pinguin jedes Mal
WHERE RANDOM()>0
