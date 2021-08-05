
{{ config(materialized='table') }}


with stg_address as (
    select * from {{ref('stg_address')}}
),

stg_stateprovince as (
    select * from {{ref('stg_stateprovince')}}
),

transformed as(
    select  
    cidade,
    id_endereco,
    s.id_estado_provincia,
    id_territorio,
    id_pais,
    nome as nome_estado_provincia,
    sigla_provincia as sigla_estado_provincia
    from stg_address as a left join stg_stateprovince as s on (a.id_estado_provincia = s.id_estado_provincia)
)

select * from transformed