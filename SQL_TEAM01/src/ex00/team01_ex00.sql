WITH cte_last_rate_to_usd AS (
    SELECT
        currency.id,
        currency.name AS currency_name,
        (SELECT rate_to_usd FROM currency
            WHERE currency.updated IN (SELECT MAX(currency.updated) FROM currency)
            AND id = balance.currency_id) AS last_rate
    FROM currency
    INNER JOIN balance ON currency.id = balance.currency_id
    GROUP BY currency.id, currency_name, balance.currency_id
)
SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    balance.type,
    SUM(COALESCE(balance.money, 1)) AS volume,
    COALESCE(currency_name, 'not defined') AS currency_name,
    COALESCE(last_rate, 1) AS last_rate_to_usd,
    SUM(COALESCE(balance.money, 1)) * COALESCE(last_rate, 1) AS total_volume_in_usd
FROM balance
FULL JOIN "user" ON "user".id = balance.user_id
LEFT JOIN cte_last_rate_to_usd ON balance.currency_id = cte_last_rate_to_usd.id
GROUP BY type, "user".id, "user".name, lastname, currency_name, last_rate
ORDER BY name DESC, lastname, type;
