/* 
Aus der Kategorie "Dinge die in R oder Python DRY finktionieren, in SQL aber nicht"
Wir hätten für die Kategorien 
bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g
gerne jeweils MEAN, STD, MIN, MAX
Und möchten dafür NICHT 16 Zeilen SQL schreiben
*/
SELECT 
    species
    {{aggregate_measurements(
        measurements=['bill_length_mm', 'bill_depth_mm', 'flipper_length_mm', 'body_mass_g'],
        aggregates=['MEAN', 'STD', 'MIN', 'MAX']
        )}}
FROM {{ ref('pngn_penguins')}}
group by species