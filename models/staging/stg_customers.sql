with source as (
    select * from {{ ref('raw_customers') }}
    -- select * from  {{ env_var('DBT_BQ_PROJECT') }}.{{ env_var('DBT_BQ_DATASET') }}.raw_customers
    -- {{ env_var("DBT_ENV_DEPLOY")["DBT_BQ_PROJECT"] }}  
    -- .{{ ref('raw_customers') }}
),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed
