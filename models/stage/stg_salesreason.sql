{{ config(materialized='table') }}

with stg_salesreason as (
    select  
        name as nome, 		
        reasontype as tipo_motivo, 		
        modifieddate as data_modificacao, 		
        salesreasonid as id_motivo_venda
        
    from {{ source('sales', 'salesreason' )}}
)

select * from stg_salesreason