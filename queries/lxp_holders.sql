with
  lxp_holders as (
    SELECT
      varbinary_substring (topic2, 13, 20) as address
    FROM
      linea.logs
    WHERE
      contract_address = 0xd83af4fbD77f3AB65C3B1Dc4B38D7e67AEcf599A
    GROUP BY
      1
  )
SELECT
  count(address) as holders
FROM
  lxp_holders
