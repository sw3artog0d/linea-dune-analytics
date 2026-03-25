SELECT sum(varbinary_to_uint256(data))/1000000000000000000 as supply
FROM linea.logs
WHERE contract_address = 0xd83af4fbD77f3AB65C3B1Dc4B38D7e67AEcf599A
