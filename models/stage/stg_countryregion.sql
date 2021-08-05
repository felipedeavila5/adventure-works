{{ config(materialized='table') }}

with stg_countryregion as (
    select  
        name as nome,
        modifieddate as data_modificacao,
        countryregioncode as id_pais,
    from {{ source('person', 'countryregion' )}}
)

select * from stg_countryregion