{{ config(materialized='table') }}

with stg_product as (
    select  
        name as nome,	
        size as tamanho,	
        class as classe,
        color as cor,
        style as estilo,
        weight as peso,
        makeflag,
        listprice as lista_de_preco,
        productid as id_produto,
        productline	 as linha_produto,
        sellenddate	 as data_fim_venda,
        modifieddate as data_modificacao,
        reorderpoint as ponto_de_reabastecimento,
        standardcost as custo_padrao,
        productnumber as numero_produto,
        sellstartdate as data_inicio_venda,
        productmodelid as id_modelo_produto,
        discontinueddate as data_descontinuado,
        safetystocklevel as level_estoque_seguro,
        daystomanufacture as dias_para_fabricar,
        finishedgoodsflag as finalizado_flag,
        sizeunitmeasurecode	as tamanho_unidade_code,
        productsubcategoryid as id_subcategoria_produto,
        weightunitmeasurecode as id_peso_unitario
        
    from {{ source('production', 'product' )}}
)

select * from stg_product