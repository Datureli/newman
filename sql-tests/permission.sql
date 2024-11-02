-- Wybór bazy danych
USE my_database;

-- Tworzenie tabeli permissions do przechowywania akcji, jakie mogą wykonywać użytkownicy
CREATE TABLE IF NOT EXISTS permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Używamy AUTO_INCREMENT zamiast SERIAL
    action VARCHAR(50) NOT NULL 
);

INSERT INTO permissions (action) VALUES
('create_post'),
('edit_post'),
('delete_post'),
('access_beta_features');

-- Tworzenie tabeli role_permissions dla przypisania uprawnień do ról
CREATE TABLE IF NOT EXISTS role_permissions (
    role ENUM('admin', 'player', 'beta_tester') NOT NULL,
    permission_id INT NOT NULL,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);

-- Przypisywanie uprawnień do ról
-- Admin ma pełne uprawnienia
INSERT INTO role_permissions (role, permission_id) VALUES
('admin', 1),
('admin', 2),
('admin', 3),
('admin', 4);

-- Player może tworzyć i edytować posty
INSERT INTO role_permissions (role, permission_id) VALUES
('player', 1),
('player', 2);

-- Beta tester ma dostęp do funkcji beta
INSERT INTO role_permissions (role, permission_id) VALUES
('beta_tester', 4);
