-- table teams_tournaments
ALTER TABLE teams_tournaments
  ADD COLUMN postseason JSONB
  CHECK (postseason IS NULL OR jsonb_typeof(postseason) = 'object');

CREATE INDEX idx_tt_postseason_gin
  ON teams_tournaments USING GIN (postseason jsonb_path_ops);

-- table players_tournaments
ALTER TABLE players_tournaments
  ADD COLUMN postseason JSONB
  CHECK (postseason IS NULL OR jsonb_typeof(postseason) = 'object');

CREATE INDEX idx_pt_postseason_gin
  ON players_tournaments USING GIN (postseason jsonb_path_ops);
