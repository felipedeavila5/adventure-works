
{{ config(materialized='table') }}


with staging as (
    select * from {{ref('stg_customer')}}
),

transformed as(
    select  id_loja,		
            id_pessoa,		
            id_cliente,		
            id_territorio,		
            data_modificacao
    from staging
)

select * from transformed