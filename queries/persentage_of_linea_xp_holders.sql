with lxp_checker as (
SELECT 
varbinary_substring(topic2, 13, 20) as address,
sum(varbinary_to_uint256(data))/1000000000000000000 as lxp
FROM linea.logs
WHERE contract_address = 0xd83af4fbD77f3AB65C3B1Dc4B38D7e67AEcf599A
GROUP BY 1
ORDER BY lxp DESC
)
SELECT
count(address) as less_than_2000
FROM lxp_checker
WHERE lxp < 2000
