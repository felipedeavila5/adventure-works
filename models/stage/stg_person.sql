{{ config(materialized='table') }}

with stg_person as (
    select  title as titulo,	
            suffix as sufixo,	
            lastname as ultimo_nome,	
            firstname as primeiro_nome,	
            namestyle as estilo_nome,	
            middlename as nome_do_meio,	
            persontype as tipo_pessoa,	
            demographics as demografia,	
            modifieddate as data_modificacao,	
            emailpromotion as email_promocional,	
            businessentityid as id_entidade,	
            additionalcontactinfo as info_contato,	
    from {{ source('person', 'person' )}}
)

select * from stg_person