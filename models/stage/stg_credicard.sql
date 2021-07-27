{{ config(materialized='table') }}

with stg_credicard as (
    select  expyear	as ano_expiracao,		
            cardtype as tipo_cartao,		
            expmonth as mes_expiracao,		
            cardnumber as numero_cartao,		
            creditcardid as id_cartao_de_credito,		
            modifieddate as data_modificacao
        
    from {{ source('sales', 'creditcard' )}}
)

select * from stg_credicard