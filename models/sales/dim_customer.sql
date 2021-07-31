
{{ config(materialized='table') }}


with staging as (
    select * from {{ref('stg_customer')}}
),

transformed as(
    select  id_loja,		
            id_pessoa,		
            id_cliente,		
            id_territorio,		
            EXTRACT(DATE FROM (PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', data_modificacao))) AS data_modificacao
    from staging
)

select * from transformed