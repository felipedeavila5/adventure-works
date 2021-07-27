{{ config(materialized='table') }}

with stg_personcreditcard as (
    select  
        creditcardid as id_cartao_de_credito,		
        modifieddate as data_modificacao, 		
        businessentityid as id_entidade 
        
    from {{ source('sales', 'personcreditcard' )}}
)

select * from stg_personcreditcard