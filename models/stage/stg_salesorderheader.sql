{{ config(materialized='table') }}

with stg_salesorderheader as (
    select  
        status as estado,		
        taxamt as montante_imposto,		
        comment as comentario,		
        duedate as data_vencimento,		
        freight as frete,		
        shipdate as data_embarque,		
        subtotal,		
        totaldue as vencimento_total,		
        orderdate as data_pedido,		
        customerid as id_cliente,		
        territoryid as id_territorio,		
        creditcardid as id_cartao_de_credito,		
        modifieddate as data_modificacao,		
        salesorderid as id_pedido_vendas,		
        shipmethodid as id_metodo_transporte,		
        accountnumber as numero_conta,		
        salespersonid as id_pessoa_vendas,		
        currencyrateid as id_taxa_moeda,		
        revisionnumber as numero_revisao,		
        billtoaddressid as id_endereco_cobranca,		
        onlineorderflag	as sinalizador_pedido_online,		
        shiptoaddressid as id_endereco_destino,		
        purchaseordernumber as numero_pedido_compra,		
        creditcardapprovalcode as id_cartao_de_credito_aprovado,
        
    from {{ source('sales', 'salesorderheader' )}}
)

select * from stg_salesorderheader