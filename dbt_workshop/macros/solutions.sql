{% macro create_pk(fields) %}
{# 
Ich habe es mir hier sehr einfach gemacht und einfach die bereits existierende dbt_utils Implementierung genutzt.
Die wäre in echt nicht empfehlenswert, da zB Die Spalten 1,11 und 11,1 das gleiche Ergebnis liefern würden.
#}
    {{concat(fields)}}
{% endmacro %}