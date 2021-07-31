{{ config(materialized='table') }}

with stg_specialoffer as (
    select  
        type as tipo,
        maxqty as qtd_max,
        minqty as qtd_min,
        enddate as data_final,
        category as categoria,
        startdate as data_inicial,
        description as descricao,
        discountpct as desconto,
        modifieddate as data_modificacao,
        specialofferid as id_oferta_especial
        
    from {{ source('sales', 'specialoffer' )}}
)

select * from stg_specialoffer