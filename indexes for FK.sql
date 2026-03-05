/*
Find FK without indexes
SELECT
    c.conrelid::regclass AS table_name,
    string_agg(a.attname, ', ') AS columns,
    c.conname AS constraint_name
FROM pg_constraint c
JOIN pg_attribute a ON a.attrelid = c.conrelid AND a.attnum = ANY(c.conkey)
WHERE c.contype = 'f'  -- foreign keys
AND NOT EXISTS (
    SELECT 1 FROM pg_index i
    WHERE i.indrelid = c.conrelid
    AND c.conkey[1] = ANY(i.indkey)
)
GROUP BY c.conrelid, c.conname
ORDER BY table_name;
*/
CREATE INDEX leagues_type_id_fk ON leagues(type_id);
CREATE INDEX teams_nation_id_fk ON teams(nation_id);
CREATE INDEX players_draft_team_id_fk ON players(draft_team_id);
CREATE INDEX players_nation_id_fk ON players(nation_id);
