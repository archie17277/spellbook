{{
    config(
        schema = 'balancer_v3_gnosis',
        alias = 'base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}

{{
    balancer_compatible_v3_trades(
        blockchain = 'gnosis',
        project = 'balancer',
        version = '3'
    )
}}