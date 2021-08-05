{{ config(materialized='table') }}

with staging as (
    select * from {{ref('stg_product')}}
),

transformed as(
    select  
        nome,	
        tamanho,	
        classe,
        cor,
        estilo,
        peso,
        id_produto,
        linha_produto,
        data_fim_venda,
        data_modificacao,
        custo_padrao,
        numero_produto,
        data_inicio_venda,
        id_modelo_produto,
        data_descontinuado,
        level_estoque_seguro,
        dias_para_fabricar,
        finalizado_flag,
        tamanho_unidade_code,
        id_subcategoria_produto,
        id_peso_unitario
        
    from staging
)

select * from transformed