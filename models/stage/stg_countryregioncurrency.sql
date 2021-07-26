{{ config(materialized='table') }}

with stg_countryregioncurrency as (
    select  currencycode as id_moeda,
            modifieddate as data_modificacao,	
            countryregioncode as id_regiao_pais
        
    from {{ source('sales', 'countryregioncurrency' )}}
)

select * from stg_countryregioncurrency