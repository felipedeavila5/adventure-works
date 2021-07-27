{{ config(materialized='table') }}

with stg_salesperson as (
    select  
        bonus,
        salesytd as vendas_qtd,		
        salesquota as vendas_cota,		
        territoryid as id_territorio,		
        modifieddate as data_modificacao,		
        commissionpct as percentage_comissao,		
        saleslastyear as vendas_no_ultimo_ano,		
        businessentityid as id_entidade,
        
    from {{ source('sales', 'salesperson' )}}
)

select * from stg_salesperson