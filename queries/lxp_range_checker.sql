WITH
    lxp_checker AS (
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
    ),
    lxp_pie_chart AS (
        SELECT
            CASE
                WHEN lxp >= 6000 THEN '>=6000 LXP'
                WHEN lxp >= 4000 THEN '4000-5999 LXP'
                WHEN lxp >= 3000 THEN '3000-3999 LXP'
                WHEN lxp >= 2000 THEN '2000-2999 LXP'
                WHEN lxp >= 1500 and lxp < 2000 THEN '1500-1999 LXP'
                WHEN lxp < 1500 THEN '0.-1500 LXP'
            END AS lxp_range,
            COUNT(*) AS count_of_users
        FROM
            lxp_checker
        GROUP BY
            1
    )
SELECT
    *
FROM
    lxp_pie_chart
