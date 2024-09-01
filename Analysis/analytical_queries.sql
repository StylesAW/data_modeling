--Show champion's kills, deaths and assist by player 'Styles'
SELECT riot_id_game_name, champion_name,  kills, deaths, assists
FROM matches
WHERE riot_id_game_name = 'Styles'

--Show KDA by champions and player
SELECT 
    riot_id_game_name,  
    CHAMPION_NAME, 
    SUM(kills) as total_kills,
    SUM(assists) AS total_assists,
    SUM(deaths) AS total_deaths,
    ROUND((SUM(kills) + SUM(assists)) / NULLIF(SUM(DEATHS),0),3) AS KDA,
FROM matches
WHERE riot_id_game_name = 'Styles'
GROUP BY riot_id_game_name, champion_name
ORDER BY KDA DESC

--Show Winrate for each champion by player 'Styles'
SELECT 
    champion_name,
    SUM(CASE WHEN win = 1 THEN 1 ELSE 0 END) AS wins,
    SUM(CASE WHEN win = 0 THEN 1 ELSE 0 END) AS losses,
    COUNT(*) AS total_games,
    (SUM(CASE WHEN win = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS winrate
FROM 
    matches
WHERE 
    riot_id_game_name = 'Styles'
GROUP BY 
    champion_name
ORDER BY 
    winrate DESC;

--Show total wins, total defeats and Winrate of player 'Styles'
SELECT 
    riot_id_game_name,
    COUNT(CASE WHEN win = TRUE THEN 1 END) AS total_Wins,
    COUNT(CASE WHEN win = FALSE THEN 1 END) AS total_defeats,
    ROUND(total_wins * 100 / COUNT(*),1) AS Winrate
FROM matches
WHERE riot_id_game_name = 'Styles'
GROUP BY riot_id_game_name

--Show winrate and loserate of player 'Styles'
SELECT
win,
COUNT(*) AS count,
COUNT(*) * 100 / (SELECT COUNT(*) FROM matches WHERE riot_id_game_name = 'Styles') AS percentage
FROM matches
WHERE riot_id_game_name = 'Styles'
GROUP BY win


--Show most used champions of 'Styles'
SELECT champion_name, COUNT(champion_name) AS most_used_champions
FROM matches
WHERE riot_id_game_name = 'Styles'
GROUP BY CHAMPION_NAME
ORDER BY most_used_champions DESC

--Show most used items of player 'Styles' without wards and vision control
SELECT
    A.riot_id_game_name,
    B.id,
    B.name,
    B.plaintext,
    B.gold_total,
    COUNT(B.name) AS most_used_items
FROM
    (SELECT riot_id_game_name, match_id, item0 AS item_id FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item1 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item2 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item3 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item4 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item5 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item6 FROM matches) A
INNER JOIN 
    items B
ON 
    A.item_id = B.id
WHERE riot_id_game_name = 'Styles'
AND B.name <> 'Farsight Alteration'
AND B.name <> 'Oracle Lens'
AND B.name <> 'Stealth Ward'
GROUP BY A.riot_id_game_name, B.id, B.name, B.plaintext, B.gold_total
ORDER BY most_used_items DESC;

--Show average match duration of player 'Styles' in minutes  
SELECT riot_id_game_name ,AVG(game_duration/60) as average_in_minutes
FROM matches
WHERE riot_id_game_name = 'Styles'
GROUP BY riot_id_game_name

--Show average gold earned of player 'Styles' before minute 20  
SELECT riot_id_game_name,AVG(gold_earned) AS average_gold_earned
FROM matches
WHERE riot_id_game_name = 'Styles'
AND (game_duration/60) < 20
GROUP BY riot_id_game_name

--Show every item in the game without tft items
SELECT name, gold_total 
FROM items
WHERE gold_total < 3800
ORDER BY gold_total DESC

--Show max and min minions killed by player before minute 20
SELECT riot_id_game_name, MAX(total_minions_killed) AS max_minions_killed, MIN(total_minions_killed) AS min_minions_killed
FROM MATCHES
WHERE (game_duration/60) > 20
GROUP BY riot_id_game_name

-- Show a rank of total damage dealt to other players by match of each player
SELECT 
    ROW_NUMBER() OVER (PARTITION BY MATCH_ID ORDER BY TOTAL_DAMAGE_DEALT_TO_CHAMPIONS DESC) AS rank, 
    MATCH_ID, 
    RIOT_ID_GAME_NAME,
    TOTAL_DAMAGE_DEALT_TO_CHAMPIONS, 
    TEAM_POSITION
FROM matches;

--This is a union table between matches and items in order to visualize the data
SELECT
    A.match_id,
    A.riot_id_game_name,
    B.id,
    B.name,
    B.plaintext,
    B.gold_base,
    B.gold_total,
    B.gold_sell
FROM
    (SELECT riot_id_game_name, match_id, item0 AS item_id FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item1 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item2 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item3 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item4 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item5 FROM matches
     UNION ALL
     SELECT riot_id_game_name, match_id, item6 FROM matches) A
INNER JOIN 
    items B
ON 
    A.item_id = B.id
WHERE riot_id_game_name = 'Styles'
AND B.gold_total > 2000
ORDER BY match_id;

