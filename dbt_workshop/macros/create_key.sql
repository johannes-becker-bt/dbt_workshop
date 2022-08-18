{# !!! comment Zeile muss gelöscht werden
{% macro create_key(fields) %}
Eine Minimale Implementierung sähe etwa so aus:

Hashfunktion(
{%- for field in fields %}
"{{field}}"{{ "," if not loop.last }}
{%- endfor %}
)

Das - nach den % Zeichen dient zum Whitespace control
https://ttl255.com/jinja2-tutorial-part-3-whitespace-control/ 

{% endmacro %}
!!! Diese Zeile auch löschen #}