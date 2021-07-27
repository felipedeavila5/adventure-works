{{ config(materialized='table') }}

with stg_salesorderheadersalesreason as (
    select  
        modifieddate as data_modificacao,		
        salesorderid as id_pedido_vendas,		
        salesreasonid as id_motivo_vendas
        
    from {{ source('sales', 'salesorderheadersalesreason' )}}
)

select * from stg_salesorderheadersalesreason