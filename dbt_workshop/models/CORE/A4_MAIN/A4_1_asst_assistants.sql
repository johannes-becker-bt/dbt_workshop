/* 
Für ein tatsächliches HR System wäre es wahrscheinlich unpraktisch, Assistenten und Wissenschaftler in unterschiedliche Gruppen zu packen.
Data Vault Modellierer Hans Hultgren würde aber sagen "Rule of three two seven and you are only at two. No Multiactive Satellites!".
Auch wenn wir hier nicht Data Vault betreiben, sorgt es (zumindest im jetzigen Use Case) für weniger Arbeit die beiden Klassen getrennt zu behandeln.
Auf das niemand befördert wird...
*/
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
FROM {{ref('A3_1_assstnts')}}


