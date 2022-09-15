SELECT
    {{ create_key(['business_key'])}} as asst_id,
    business_key,
    -- diskutiere mit deinem Nachbarn, wie man FKs in der Tabelle einführt
    isl as ilnd_island_id, 
    fst as first_name,
    lst as last_name,
    phn as phone_number,
    ads as address,
    cty as city,
    zip as zip_code,
    ctry as country
FROM {{ref('A3_2_scntsts')}}


