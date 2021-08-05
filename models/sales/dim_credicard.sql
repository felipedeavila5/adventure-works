
{{ config(materialized='table') }}


with staging as (
    select * from {{ref('stg_credicard')}}
),

transformed as(
    select  tipo_cartao,	
            id_cartao_de_credito,		
            EXTRACT(DATE FROM (PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', data_modificacao))) AS data_modificacao
    from staging
)

select * from transformed