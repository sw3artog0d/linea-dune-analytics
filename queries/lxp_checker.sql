WITH lxp_checker AS (
SELECT
    VARBINARY_SUBSTRING (topic2, 13, 20) AS address,
    SUM(VARBINARY_TO_UINT256 (data)) / 1000000000000000000 AS lxp
FROM
    linea.logs
WHERE
    contract_address = 0xd83af4fbD77f3AB65C3B1Dc4B38D7e67AEcf599A
GROUP BY
    1
ORDER BY
    lxp DESC
)

SELECT lxp FROM lxp_checker
WHERE address = {{address}}
