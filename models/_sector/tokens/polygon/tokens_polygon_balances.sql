{{ config(
        schema = 'tokens_polygon',
        alias = 'balances',
        materialized = 'view'
        )
}}

with balances_raw as (
{{balances_fix_schema(
    source('tokens_polygon', 'balances_polygon')
    ,'polygon'
    ,'0x0000000000000000000000000000000000001010')}}
)

{{
    balances_enrich(
        balances_raw = 'balances_raw',
    )
}}
