/*
Wir haben bei einem unserer Projekte mehrere run-oprations
Neben "Mache ein Backup von allen Modelln in einem Schema"
auch "Lösche in einem Schema alle Tabellen und Views, die nicht teil von dbt sind"

Ansätze dafür findet ihr hier:
https://docs.getdbt.com/reference/dbt-jinja-functions/run_query

Das war bei uns der erste unterordner in Macros, 
weil die Anzahl an Macros langsam zweistellig wurde und run-operations nicht wie normale Macros
Code Injection sind
Wo wir dabei sind:
hooks sollte ich auch in einen anderen Ordner packen...
*/