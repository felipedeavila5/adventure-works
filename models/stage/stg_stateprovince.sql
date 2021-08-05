{{ config(materialized='table') }}

with stg_stateprovince as (
    select  
        name as nome,
        territoryid as id_territorio,
        modifieddate as data_modificacao,
        stateprovinceid as id_provincia,
        countryregioncode as id_pais,
        stateprovincecode as sigla_provincia,
    from {{ source('person', 'stateprovince' )}}
)

select * from stg_stateprovince