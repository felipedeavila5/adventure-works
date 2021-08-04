
{{ config(materialized='table') }}


with stg_customer as (
    select * from {{ref('stg_customer')}}
),

stg_person as (
    select * from {{ref('stg_person')}}
),

transformed as(
    select  id_loja,		
            id_pessoa,		
            id_cliente,		
            id_territorio,
            titulo,	
            sufixo,	
            ultimo_nome,	
            primeiro_nome,
            CONCAT(COALESCE(titulo, ''), ' ', 
                   COALESCE(sufixo, ''), ' ', 
                   COALESCE(primeiro_nome, ''), ' ', 
                   COALESCE(nome_do_meio, ''), ' ', 
                   COALESCE(ultimo_nome, '')) as nome_completo,	
            estilo_nome,	
            nome_do_meio,	
            tipo_pessoa,	
            demografia,
    from stg_customer as c left join stg_person as p on (c.id_pessoa = p.id_entidade)
)

select * from transformed