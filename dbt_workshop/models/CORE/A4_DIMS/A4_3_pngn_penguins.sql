SELECT
    business_key as pngn_id,
    penguin_island_id,
    species,
    island,
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm,
    body_mass_g,
    sex
FROM {{ ref('A1_1_UPDATE_PENGUINS') }}