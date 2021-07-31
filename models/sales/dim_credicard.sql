
{{ config(materialized='table') }}


with staging as (
    select * from {{ref('stg_credicard')}}
),

transformed as(
    select  tipo_cartao,	
            id_cartao_de_credito,		
            data_modificacao
    from staging
)

select * from transformed