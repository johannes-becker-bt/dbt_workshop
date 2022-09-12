/* 
Hier gibt es gerade nicht viel zu tun.
Diskutiere mit deinem Banknachbarn, ob du hier schon die Spaltennamen ändern würdest oder erst im Core.
*/
SELECT
{{create_key(['isl','id'])}} as business_key,
*
from {{ ref('src_scntsts')}}