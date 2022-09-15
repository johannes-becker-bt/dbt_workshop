SELECT
    {{ create_key(['business_key'])}} as scts_id,
    -- diskutiere mit deinem Nachbarn, wie man FKs in der Tabelle einführt
    id as scientist_on_island_id,
    isl as ilnd_island_id, 
    fst as first_name,
    lst as last_name,
    phn as phone_number,
    ads as address,
    cty as city,
    zip as zip_code,
    ctry as country
FROM {{ref('A3_2_scntsts')}}


