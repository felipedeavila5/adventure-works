{{ config(materialized='table') }}

with stg_customer as (
    select  
        rowguid as id_linha,		
        storeid as id_loja,		
        personid as id_pessoa,		
        customerid as id_cliente,		
        territoryid as id_territorio,		
        modifieddate as data_modificacao
        
    from {{ source('sales', 'customer' )}}
)

select * from stg_customer