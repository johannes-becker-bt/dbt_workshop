{{ config(unique_key='penguin_key||insert_ts') }}
/*
BONUS AUFGABE: Füge eine Snapshot Tabelle hinzu, die den Glückszustand jedes Pinguins trackt (Vorsicht: sqlite benötigt eventuell zusätzliche extensions)
*/
SELECT
    *
FROM {{ref('A1_2_INSERT_PENGUINS')}}