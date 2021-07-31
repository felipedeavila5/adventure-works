{{ config(materialized='table') }}

with stg_specialofferproduct as (
    select  
        productid as id_product,
        modifieddate as data_modificacao,
        specialofferid as id_oferta_especial
        
    from {{ source('sales', 'specialofferproduct' )}}
)

select * from stg_specialofferproduct