/* 1. Представление, которое показывает последние 10 записей таблицы match, в которой id игроков 
заменены на их никнеймы, id рас и карт - на их названия. Также показывается лига каждого игрока.
Отсортировано по дате матча, показывая сначала более поздние. */

CREATE OR REPLACE VIEW `match_history` AS
SELECT 
    m.id,
    p1.nickname AS 'Player 1',
    l1.`name` AS P1_League,
    r1.`name` AS P1_Race,
    p2.nickname AS 'Player 2',
    l2.`name` AS P2_League,
    r2.`name` AS P2_Race,
    mp.`name` AS Map,
    m.match_duration AS Duration,
    m.played_at AS Played,
    CASE player_won
        WHEN 1 THEN p1.nickname
        WHEN 2 THEN p2.nickname
    END AS Winner,
    player_1_mmr_change AS 'Player 1 MMR',
    player_2_mmr_change AS 'Player 2 MMR'
FROM
    `match` m
        JOIN
    `profile` p1 ON m.player_1_id = p1.user_id
        JOIN
    `profile` p2 ON m.player_2_id = p2.user_id
        JOIN
    `race` r1 ON m.player_1_race_id = r1.id
        JOIN
    `race` r2 ON m.player_2_race_id = r2.id
        JOIN
    `map` mp ON m.map_id = mp.id
        JOIN
    league l1 ON p1.league_id = l1.id
        JOIN
    league l2 ON p2.league_id = l2.id
ORDER BY played_at DESC
LIMIT 10


-- ******************************************************************************

/* 2. Показать величину изменения рейтинга (MMR) каждого игрока за все сыгранные матчи.*/

SELECT 
    p.nickname,
    SUM(CASE
        WHEN p.user_id = m.player_1_id THEN player_1_mmr_change
        WHEN p.user_id = m.player_2_id THEN player_2_mmr_change
    END) AS 'MMR Change'
FROM
    `profile` p
        LEFT JOIN
    `match` m ON (m.player_1_id = p.user_id)
        OR (m.player_2_id = p.user_id)
GROUP BY p.nickname


-- ******************************************************************************

/* 3. Вывести имена и фамилии игроков, которые имеют не менее 50 очков достижений,
полученных за 2021 год. Показать количество этих очков в убывающем порядке. */

SELECT 
    CONCAT(first_name, ' ', last_name) AS `Name`,
    SUM(a.points_given) AS Points
FROM
    `profile` p
        JOIN
    achievement_user au ON au.profile_user_id = p.user_id
        JOIN
    achievement a ON a.id = au.achievement_id
WHERE
    au.achieved_at >= '2021-01-01 00:00:00'
GROUP BY `Name`
HAVING Points >= 50
ORDER BY Points DESC


-- ******************************************************************************

/* 4. Показать количество игроков в каждой лиге. */

SELECT
    `name` AS League,
    (SELECT COUNT(*)
    FROM (SELECT league_id FROM `profile` WHERE league_id = league.id) t) AS `Number`
FROM league
ORDER BY id