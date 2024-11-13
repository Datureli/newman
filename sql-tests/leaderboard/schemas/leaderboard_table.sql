CREATE TABLE user_points (
  user_id BIGINT UNSIGNED,  -- lub inny typ zgodny z referencją w tabeli 'users'
  points INT,
  PRIMARY KEY (user_id),
  CONSTRAINT user_points_ibfk_1 FOREIGN KEY (user_id) REFERENCES users(id)
);
