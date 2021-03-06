DROP VIEW IF EXISTS activity_leaderboards;
CREATE VIEW activity_leaderboards AS SELECT 
COUNT(*) AS count, player_id_owner, player_id, player.name AS player_name
FROM log 
INNER JOIN player ON player.id = log.player_id
WHERE log.accepted IS NOT NULL
GROUP BY player_id, player_id_owner
ORDER BY count DESC;