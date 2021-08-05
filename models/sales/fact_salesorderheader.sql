
{{ config(materialized='table') }}


with stg_salesorderheader as (
    select * from {{ref('stg_salesorderheader')}}
),

stg_salesorderdetail as (
    select * from {{ref('stg_salesorderdetail')}}
),

transformed as(
    select 
        soh.estado,		
        soh.montante_imposto,
        EXTRACT(DATE FROM (PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', soh.data_vencimento))) AS data_vencimento,		
        soh.frete,		
        EXTRACT(DATE FROM (PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', data_embarque))) AS data_embarque,		
        subtotal,		
        soh.vencimento_total,		
        EXTRACT(DATE FROM (PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', data_pedido))) AS data_pedido,		
        soh.id_cliente,		
        soh.id_territorio,		
        soh.id_cartao_de_credito,		
        soh.id_metodo_transporte,
        soh.id_pessoa_vendas,	
        soh.id_taxa_moeda,
        soh.sinalizador_pedido_online,		
        soh.id_endereco_destino,		
        soh.id_cartao_de_credito_aprovado,
        sod.qtd_pedido,		
        sod.id_produto,		
        sod.preco_unitario,
        sod.id_pedido_vendas,		
        sod.id_oferta_especial,		
        sod.desconto_preco_unitario,		
        sod.id_pedido_detalhe_vendas,
        sod.numero_rastreamento_operadora,
        sod.total_negociado	
        
    from  stg_salesorderdetail as sod
    left join stg_salesorderheader as soh
    on (sod.id_pedido_vendas = soh.id_pedido_vendas)
)

select * from transformed