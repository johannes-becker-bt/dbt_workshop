{% macro create_key(fields) %}
{# 
Einfaches concat
Die Lösung wäre in echt nicht empfehlenswert, da zB Die Spalten 1,11 und 11,1 das gleiche Ergebnis liefern würden.
#}
{%- for field in fields %}
"{{field}}"{{ "||" if not loop.last }}
{%- endfor %}
{% endmacro %}