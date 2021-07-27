{{ config(materialized='table') }}

with stg_salespersonquotahistory as (
    select  
        quotadate as data_cota,	
        salesquota as vendas_cota,
        modifieddate as	data_modificacao,	
        businessentityid as id_entidade
        
    from {{ source('sales', 'salespersonquotahistory' )}}
)

select * from stg_salespersonquotahistory