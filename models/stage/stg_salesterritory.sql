{{ config(materialized='table') }}

with stg_salesterritory as (
    select  
        name as nome,	
        `group` as grupo,	
        costytd as custo_ytd,	
        salesytd as vendas_ytd,	
        territoryid as id_territorio,	
        costlastyear as custo_ultimo_ano,	
        modifieddate as data_modificacao,	
        saleslastyear as vendas_ultimo_ano,	
        countryregioncode as id_regiao_pais	
        
    from {{ source('sales', 'salesterritory' )}}
)

select * from stg_salesterritory