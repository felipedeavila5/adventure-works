{{ config(materialized='table') }}

with stg_store as (
    select  
        name as nome,	
        demographics as demografia,	
        modifieddate as data_modificacao,	
        salespersonid as id_pessoa_vendas,	
        businessentityid as	id_entidade
        
    from {{ source('sales', 'store' )}}
)

select * from stg_store