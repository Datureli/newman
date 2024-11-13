CREATE TABLE IF NOT EXISTS user_points (
  user_id BIGINT UNSIGNED,
  points INT,
  position INT,
  PRIMARY KEY (user_id),
  CONSTRAINT user_points_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(id)
);
