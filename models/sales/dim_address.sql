
{{ config(materialized='table') }}


with stg_address as (
    select * from {{ref('stg_address')}}
),

stg_stateprovince as (
    select * from {{ref('stg_stateprovince')}}
),

stg_countryregion as (
    select * from {{ref('stg_countryregion')}}
),

transformed as(
    select  
    cidade,
    id_endereco,
    s.id_estado_provincia,
    id_territorio,
    s.id_pais,
    s.nome as nome_estado_provincia,
    c.nome as nome_pais,
    sigla_estado_provincia
    from stg_address as a 
    left join 
    stg_stateprovince as s 
    on (a.id_estado_provincia = s.id_estado_provincia)
    left join stg_countryregion as c
    on (c.id_pais = s.id_pais)
)

select * from transformed