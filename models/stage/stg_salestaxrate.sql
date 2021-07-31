{{ config(materialized='table') }}

with stg_salestaxrate as (
    select  
        name as nome,	
        taxrate as taxa_imposto,	
        taxtype as tipo_imposto,	
        modifieddate as data_modificacao,	
        salestaxrateid as id_vendas_taxa_imposto,	
        stateprovinceid as id_provincia_estado,	
        
    from {{ source('sales', 'salestaxrate' )}}
)

select * from stg_salestaxrate