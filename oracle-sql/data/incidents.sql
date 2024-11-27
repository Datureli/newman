-- Wprowadzanie danych do tabeli Incidents
INSERT ALL
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (1, 1, 'Fracture', '45.4215 N, 75.6972 W', SYSDATE - INTERVAL '2' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (2, 2, 'Allergic reaction', '47.3769 N, 8.5417 E', SYSDATE - INTERVAL '1' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (3, 3, 'Heat stroke', '40.7128 N, 74.0060 W', SYSDATE - INTERVAL '3' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (4, 4, 'Gunshot wound', '34.0522 N, 118.2437 W', SYSDATE - INTERVAL '5' DAY)
    INTO Incidents (IncidentID, SoldierID, IncidentType, Location, Timestamp)
    VALUES (5, 5, 'Burn', '48.8566 N, 2.3522 E', SYSDATE - INTERVAL '7' DAY)
SELECT * FROM DUAL;