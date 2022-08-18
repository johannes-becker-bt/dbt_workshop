/* 
Auf mehreren Inseln untersuchen Forscher Pinguine, wobei jeder Pinguin auf der Insel eine eindeutigen Chip hat, 
der ihn auf der Insel eindeutig identifiziert.
Um jetzt alle Pinguine eindeutig erkennbar zu machen, muss die Insel und der Pinguin verknüpft werden
Aufgabe:
1. Schreibe das Macro create_key. Du kannst hierbei frei entscheiden, ob du es über einen String Concatenate oder einen Hashtype oder oder oder lösen willst.
Den Output deines Macros findest du nach dbt run unter dbt_workshop/target/compiled/dbt_workshop/models/A1_FAKE_STAGE/A1_1_UPDATE_PENGUINS.sql
2. SPÄTER: Nutze diese Stage Tabelle in einer weiteren Tabelle mit Incremental Load. 
*/
SELECT 
{{create_key(['penguin_island_id','island'])}} as penguin_key,
*,
CASE WHEN RANDOM()<0 THEN 0 ELSE 1 END as is_the_penguin_happy 
FROM {{ref('raw_penguins')}}
-- Die Forscher analysieren nicht jeden Pinguin jedes Mal
WHERE RANDOM()>0
