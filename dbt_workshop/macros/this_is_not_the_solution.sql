{# 
Das hier ist eine ganz schlechte Lösung für eins der Probleme
und sie existiert nur, damit der Code durchläuft!
#}

{% macro create_key(fields) %}
{# 
Einfaches concat
Die Lösung wäre in echt nicht empfehlenswert, da zB Die Spalten 1,11 und 11,1 das gleiche Ergebnis liefern würden.
#}
{{dbt_utils.concat(fields)}}
{% endmacro %}