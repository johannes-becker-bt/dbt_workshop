{{ config(unique_key='penguin_key') }}
/*
BONUS AUFGABE: Füge eine Snapshot Tabelle hinzu, die den Glückszustand jedes Pinguins trackt (Vorsicht: sqlite benötigt eventuell zusätzliche extensions)
*/
SELECT
    *
FROM {{ref('A1_1_UPDATE_PENGUINS')}}