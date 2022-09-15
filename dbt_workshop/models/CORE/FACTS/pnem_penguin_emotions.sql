/*
Wir haben hier ja bereits die Dimension Pinguin. Bei der Datenmenge schleifen wir die Informationen jetzt einfach mit
*/
SELECT
    {{ create_key(['business_key','observation_ts'])}} as pnem_id,
    business_key as pngn_penguin_id,
    observation_ts,
    pngn.island as island_name,
    ilnd.island_id as ilnd_island_id,
    species,
    island,
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm,
    body_mass_g,
    sex,
    is_the_penguin_happy,
    scts.scts_id as scts_scientist_id,
    asst.asst_id as asst_assistant_id
FROM {{ ref('A2_2_PENGUIN_SATELLITE') }} pngn
LEFT JOIN {{ ref('meta_islands')}} ilnd -- natürlich gehört die insel eigentlich ins Core...
    ON pngn.island=ilnd.island_name
LEFT JOIN {{ ref('asst_assistants')}} asst
    ON pngn.assistant_id = asst.assistant_on_island_id 
        AND ilnd.island_id = asst.ilnd_island_id
LEFT JOIN {{ ref('scts_scientists')}} scts
    ON pngn.scientist_id = scts.scientist_on_island_id 
        AND ilnd.island_id = scts.ilnd_island_id