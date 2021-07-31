
{{ config(materialized='table') }}


with stg_salesreason as (
    select * from {{ref('stg_salesreason')}}
),

stg_salesorderheadersalesreason as (
    select * from {{ref('stg_salesorderheadersalesreason')}}
),

transformed as(
    select 
        data_modificacao,		
        id_pedido_vendas,		
        id_motivo_vendas,
        nome, 		
        tipo_motivo, 		
        data_modificacao, 		
        id_motivo_venda
    from  stg_salesorderheadersalesreason as sosr
    left join stg_salesreason as sr
    on (sosr.id_motivo_venda = sosr.id_motivo_venda)
)

select * from transformed