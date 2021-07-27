{{ config(materialized='table') }}

with stg_currency as (
    select  name as nome,		
            currencycode as id_moeda,		
            modifieddate as data_modificacao
        
    from {{ source('sales', 'currency' )}}
)

select * from stg_currency