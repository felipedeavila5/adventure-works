{{ config(materialized='table') }}

with stg_address as (
    select  
        city as cidade,	
        addressid as id_endereco,	
        postalcode as cep,	
        addressline1 as endereco1,	
        addressline2 as endereco2,	
        modifieddate as data_modificacao,	
        spatiallocation as coordenadas,	
        stateprovinceid	as id_provincia	
    from {{ source('person', 'address' )}}
)

select * from stg_address