{% macro test_demo(model, column_name) %}

with test as (
    select 
      {{ column_name }} as test_field
    from {{ model }}
),

validation as (
    select
      test_field
    from test
    where (test_field % 2) = 1
)

select count(*)
from validation

{% endmacro %}