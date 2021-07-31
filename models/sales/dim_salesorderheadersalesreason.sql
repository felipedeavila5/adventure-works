
{{ config(materialized='table') }}


with stg_salesreason as (
    select * from {{ref('stg_salesreason')}}
),

stg_salesorderheadersalesreason as (
    select * from {{ref('stg_salesorderheadersalesreason')}}
),

transformed as(
    select 
        sosr.id_pedido_vendas,
        sosr.id_motivo_venda
        nome, 		
        tipo_motivo
    from  stg_salesorderheadersalesreason as sosr
    left join stg_salesreason as sr
    on (sosr.id_motivo_venda = sr.id_motivo_venda)
)

select * from transformed