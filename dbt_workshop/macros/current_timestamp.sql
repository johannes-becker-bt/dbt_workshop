{% macro sqlite__current_timestamp() %}
{# nicht einmal notwendig, da die Standardimplementierung von dbt-core datetime() nutzt, was sqlite auch kann #}
    CURRENT_TIMESTAMP
{% endmacro %}