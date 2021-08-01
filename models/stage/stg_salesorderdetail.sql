{{ config(materialized='table') }}

with stg_salesorderdetail as (
    select  
        orderqty as qtd_pedido,		
        productid as id_produto,		
        unitprice as preco_unitario,		
        modifieddate as data_modificacao,		
        salesorderid as id_pedido_vendas,		
        specialofferid as id_oferta_especial,		
        unitpricediscount as desconto_preco_unitario,		
        salesorderdetailid as id_pedido_detalhe_vendas,
        carriertrackingnumber as numero_rastreamento_operadora,
        orderqty*unitprice as total_negociado	
        
    from {{ source('sales', 'salesorderdetail' )}}
)

select * from stg_salesorderdetail