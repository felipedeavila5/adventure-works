{{ config(materialized='table') }}

with stg_currencyrate as (
    select  averagerate	as taxa_media,		
            endofdayrate as taxa_fim_do_dia,		
            modifieddate as data_moficicacao,		
            currencyrateid	as id_taxa_moeda,		
            tocurrencycode as id_moeda_final,		
            currencyratedate as data_taxa_moeda,		
            fromcurrencycode as id_moeda_inicial
        
    from {{ source('sales', 'currencyrate' )}}
)

select * from stg_currencyrate