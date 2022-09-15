{{ config(unique_key='business_key||observation_ts') }}
/*
Wir benutzen hier einen konkatenierten Key aus key und observation_ts (hat etwas von einem Data Vault Satelliten ohne den surrogate key)
Mehrere Dinge sind zu beachten:
1. Schmerzhafte Erfahrung: Concat von zeitstempeln kann dazu führen, dass Millisekunden abgeschnitten werden
   zB https://dba.stackexchange.com/questions/221369/how-to-concat-datetime-without-losing-second-precision
2. Wegen 1 und zur Automatisierung von Prozessen und Tests kann es zielführender sein, wenn in jeder Tabelle der PK identisch benannt ist
   Eröffnet dann aber neue Probleme: Wir haben dann noch keine unique id pro Pinguin
*/
SELECT
    *
FROM {{ref('A1_2_INSERT_PENGUINS')}}
{% if is_incremental() %}
/* 
AUFGABE: Performanzoptimierung. Wir nehmen an, dass A1_2_INSERT_PENGUINS immer alle Daten enthält
und das observation_ts zuverlässig größer wird.
Wie können wir einen incremental Load schreiben, der nur die minimale Menge an neuen Daten hinzufügt?
*/
{% endif %}