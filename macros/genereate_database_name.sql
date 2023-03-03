{% macro generate_database_name(custom_database_name=none, node=none) -%}

    {{ log("Running generate database name macro") }}
    {% set default_database = 'jdp-spt-data-warehouse-zbat' %}
    {% set dev_database = 'jdp-dev-data-warehouse-lacg' %}
    {% set test_database = 'jdp-test-data-warehouse-3hid' %}
    {% set uat_database = '' %}
    {% set production_database = '' %}


    {% if env_var('DBT_BQ_DATASET') == "prod" %}

        {{ production_database }}

    {% elif env_var('DBT_BQ_DATASET') == "uat" %}

        {{ uat_database }}

    {% elif env_var('DBT_BQ_DATASET') == "test" %}

        {{ test_database }}

    {% elif env_var('DBT_BQ_DATASET') == "dev" %}

        {{ dev_database }}

    {% elif env_var('DBT_BQ_DATASET') == "spt" %}

        {{ dev_database }}

    {% else %}

        {{ default_database }}
    {% endif %}


{% endmacro %}