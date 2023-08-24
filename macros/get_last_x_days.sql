{% macro get_last_x_days(table_name, column_name, daycount=3) -%}
{% if target.name =='dev' -%}
{% if table_name in var('source_names')-%}
{% set schema_name=table_name.split('.')[0] %}
{% set table_name=table_name.split('.')[1] %}
where {{column_name}}>=dateadd('day', -({{daycount}}), (select max( {{column_name}} ) from {{ source(schema_name , table_name) }} ) )
{% else %}
where {{column_name}}>=dateadd('day', -({{daycount}}), (select max( {{column_name}} ) from {{ ref(table_name) }} ) )
{%- endif %}
{%- endif %}
{%- endmacro %}