CREATE TABLE waste_collection (
    bin_id TEXT PRIMARY KEY,
    location TEXT NOT NULL,
    waste_type TEXT NOT NULL,
    fill_level REAL,
    waste_weight REAL,
    hotspot_level TEXT
        CHECK (hotspot_level IN ('Low', 'Medium', 'High', 'Normal')),
    collection_status TEXT
        CHECK (collection_status IN ('Pending', 'Completed')),
    collection_date TEXT
);

BEGIN TRANSACTION;

INSERT INTO waste_collection VALUES
('BIN_01074','East','Organic',82.4,69.44,'Medium','Completed','2026-10-02'),
('BIN_01806','South','Plastic',86.02,73.44,'High','Completed','2026-09-27'),
('BIN_02579','North','Organic',62.9,49.61,'Medium','Completed','2026-10-02'),
('BIN_02729','South','Glass',80.97,62.57,'High','Completed','2026-09-27'),
('BIN_03472','West','Paper',42.3,41.83,'Low','Pending',NULL),
('BIN_03553','Central','Organic',37.93,25.23,'Low','Completed','2026-09-30'),
('BIN_04795','North','Metal',39.09,34.33,'Normal','Pending',NULL),
('BIN_05834','East','Organic',37.36,28.47,'Low','Completed','2026-09-30'),
('BIN_06854','East','Paper',59.08,52.15,'High','Pending',NULL),
('BIN_09046','Central','Glass',36.88,34.33,'Low','Pending',NULL),
('BIN_09285','South','Organic',43.7,31.67,'High','Pending',NULL),
('BIN_09902','North','Plastic',88.47,85.42,'High','Pending',NULL),
('BIN_10593','East','Paper',99.3,77.21,'High','Pending',NULL),
('BIN_12251','North','Metal',63.32,46.34,'Low','Completed','2026-09-23'),
('BIN_12606','East','Plastic',71.5,58.2,'High','Pending',NULL),
('BIN_13847','North','Glass',52.28,46.53,'Medium','Completed','2026-10-03'),
('BIN_14120','South','Glass',29.32,18.59,'Normal','Completed','2026-09-27'),
('BIN_14861','West','Metal',83.91,69.79,'High','Completed','2026-09-27'),
('BIN_15924','Central','Organic',51.48,40.31,'Medium','Completed','2026-10-02'),
('BIN_16875','East','Plastic',67.25,55.4,'Medium','Pending',NULL),
('BIN_17932','South','Paper',45.6,32.8,'Low','Completed','2026-09-29'),
('BIN_18842','West','Organic',74.5,61.2,'High','Pending',NULL),
('BIN_19884','East','Plastic',57.99,52.5,'Medium','Pending',NULL),
('BIN_20563','North','Metal',33.4,24.6,'Low','Completed','2026-09-30'),
('BIN_21976','Central','Glass',91.2,80.5,'High','Pending',NULL);

COMMIT;

-- Q1: Display all waste collection records
SELECT * FROM waste_collection;

-- Q2: Count total records
SELECT COUNT(*) AS total_records
FROM waste_collection;

-- Q3: Average fill level for each location
SELECT location, ROUND(AVG(fill_level), 2) AS average_fill_level
FROM waste_collection
GROUP BY location;

-- Q4: Number of bins for each collection status
SELECT collection_status, COUNT(*) AS total_bins
FROM waste_collection
GROUP BY collection_status;

-- Q5: High hotspot bins that are still pending
SELECT bin_id, location, waste_type, fill_level, waste_weight
FROM waste_collection
WHERE hotspot_level = 'High'
AND collection_status = 'Pending'
ORDER BY fill_level DESC;
