CREATE DATABASE LEAGUE_OF_LEGENDS_DATA;
USE DATABASE LEAGUE_OF_LEGENDS_DATA;
CREATE SCHEMA LOL_MATCH_STATS;


USE SCHEMA LOL_MATCH_STATS;
TRUNCATE TABLE MATCHES;
DESCRIBE TABLE MATCHES;

CREATE OR REPLACE TABLE items (
    id INT PRIMARY KEY
    name VARCHAR(255),
    plaintext STRING,
    gold_base INT,
    gold_botal INT,
    gold_sell INT
);

CREATE OR REPLACE TABLE items_stats (
    item_id INT,
    stat_name VARCHAR(255),
    value INT,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE OR REPLACE TABLE champions (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    title TEXT,
    blurb TEXT,
    tags TEXT,
    partype VARCHAR
)

CREATE OR REPLACE TABLE matches (
    match_id VARCHAR,
    game_mode VARCHAR,
    game_duration INT,
    puuid VARCHAR,
    riot_id_game_name VARCHAR,
    win BOOLEAN,
    lane VARCHAR,
    role VARCHAR,
    team_position VARCHAR,
    kills INT,            
    deaths INT,          
    assists INT,          
    total_minions_killed INT,
    eligible_for_progression BOOLEAN,
    time_played INT,
    killing_sprees INT,
    first_blood_kill BOOLEAN,
    first_tower_kill BOOLEAN,
    double_kills INT,
    triple_kills INT,
    quadra_kills INT,
    penta_kills INT,
    wards_killed INT,
    wards_placed INT,
    vision_wards_bought_in_game INT,
    detector_wards_placed INT,
    objectives_stolen INT,
    turret_kills INT,
    dragon_kills INT,
    enemy_missing_pings INT,
    item0 INT,
    item1 INT,
    item2 INT,
    item3 INT,
    item4 INT,
    item5 INT,
    item6 INT,
    gold_earned INT,
    largest_killing_spree INT,
    largest_multi_kill INT,
    magic_damage_dealt_to_champions INT,
    magic_damage_taken INT,
    neutral_minions_killed INT,
    participant_id INT,
    physical_damage_dealt_to_champions INT,
    physical_damage_taken INT,
    team_id INT,
    total_damage_dealt_to_champions INT,
    total_damage_taken INT,
    total_heal INT,
    total_heals_on_teammates INT,
    true_damage_dealt_to_champions INT,
    true_damage_taken INT,
    vision_score INT,
    champion_id VARCHAR,
    FOREIGN KEY (item0) REFERENCES items(id),
    FOREIGN KEY (item1) REFERENCES items(id),
    FOREIGN KEY (item2) REFERENCES items(id),
    FOREIGN KEY (item3) REFERENCES items(id),
    FOREIGN KEY (item4) REFERENCES items(id),
    FOREIGN KEY (item5) REFERENCES items(id),
    FOREIGN KEY (item6) REFERENCES items(id),
    FOREIGN KEY (champion_id) REFERENCES champions(id)
);
