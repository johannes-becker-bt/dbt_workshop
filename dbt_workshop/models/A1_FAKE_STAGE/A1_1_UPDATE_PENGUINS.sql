/* 
Auf mehreren Inseln untersuchen Forscher Pinguine, wobei jeder Pinguin auf der Insel eine eindeutigen Chip hat, der ihn durchnummeriert
Um jetzt alle Pinguine eindeutig erkennbar zu machen, muss die Insel und der Pinguin verknüpft werden
Aufgaben:
1. Schreibe das Makro create_pk. du kannst hierbei frei entscheiden, ob du es über einen String Concatenate oder einen Hashtype oder oder oder lösen willst.
2. Betrachte das Makro current_timestamp: Das Makro current_timestamp existiert bereits in dbt_utils. 
https://github.com/dbt-labs/dbt-utils/blob/main/macros/cross_db_utils/current_timestamp.sql
Die Idee hier ist, dass es eine default Implementierung gibt (default__curent_timestamp) und man dann für unterschiedliche SQL Flavor einen Adapter schreiben kann.
Als Beispiel gibt es hier den Adapter sqlite__curent_timestamp
*/
SELECT 
{{create_pk(['penguin_island_id','island'])}} as stage_pk,
*,
{{current_timestamp()}} as insert_ts 
FROM {{ref('raw_penguins')}}