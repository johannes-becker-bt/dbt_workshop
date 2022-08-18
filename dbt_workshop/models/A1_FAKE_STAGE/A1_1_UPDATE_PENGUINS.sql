/* 
Auf mehreren Inseln untersuchen Forscher Pinguine, wobei jeder Pinguin auf der Insel eine eindeutigen Chip hat, der ihn durchnummeriert
Um jetzt alle Pinguine eindeutig erkennbar zu machen, muss die Insel und der Pinguin verknüpft werden
Aufgabe:
1. Schreibe das Makro create_key. du kannst hierbei frei entscheiden, ob du es über einen String Concatenate oder einen Hashtype oder oder oder lösen willst.
Das Ergebnis findest du nach dbt run unter dbt_workshop/target/compiled/dbt_workshop/models/A1_FAKE_STAGE/A1_1_UPDATE_PENGUINS.sql
2. SPÄTER: Nutze diese Stage Tabelle in einer weiteren Tabelle mit Incremental Load. 

BONUS AUFGABE: Füge eine Snapshot Tabelle hinzu, die den Glückszustand jedes Pinguins trackt (Vorsicht: sqlite benötigt eventuell zusätzliche extensions)
*/
SELECT 
{{create_key(['penguin_island_id','island'])}} as penguin_key,
*,
CASE WHEN RANDOM()<0 THEN 0 ELSE 1 END as is_the_penguin_happy 
FROM {{ref('raw_penguins')}}