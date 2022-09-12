{{ config(unique_key='business_key') }}
/*
Überlege was das Ergebnis dieser Tabelle ist
BONUS AUFGABE: Füge eine Snapshot Tabelle hinzu, die den Glückszustand jedes Pinguins trackt (Vorsicht: sqlite benötigt eventuell zusätzliche extensions)
*/
SELECT
    *
FROM {{ref('A1_1_UPDATE_PENGUINS')}}