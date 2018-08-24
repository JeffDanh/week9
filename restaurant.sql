-- CREATE TABLE restaurant(
--     name varchar,
--     distance integer,
--     stars integer,
--     category varchar,
--     favorite_dish varchar,
--     takeout boolean,
--     previous_visit date
-- );

-- INSERT INTO restaurant VALUES(
--     'Pizza Pie', 19, 4, 'pizza', 'pineapple pizza', TRUE, '2018-06-25'
-- );

-- INSERT INTO restaurant VALUES(
--     'Seaside Poke', 2, 5, 'raw fish', 'yellowtail', TRUE, '2018-07-16'
-- );

-- INSERT INTO restaurant VALUES(
--     'Texas BBQ', 7, 3, 'BBQ', 'BBQ Ribs', TRUE, '2018-08-20'
-- );

-- INSERT INTO restaurant VALUES(
--     'Bullritos', 8, 4, 'Burritos', 'Burritos', TRUE, '2018-08-15'
-- );




-- ALTER TABLE restaurant ADD COLUMN id SERIAL PRIMARY KEY;

-- SELECT name FROM restaurant where stars = 5;

-- SELECT favorite_dish FROM restaurant where stars = 5;

-- SELECT id FROM restaurant where name = 'Pizza Pie';

-- SELECT * FROM restaurant WHERE category = 'BBQ';

-- SELECT * FROM restaurant WHERE takeout = TRUE;

-- SELECT * FROM restaurant WHERE takeout = TRUE and category = 'BBQ';

-- SELECT * FROM restaurant WHERE distance <= 2;

-- SELECT * FROM restaurant WHERE previous_visit >= '2018-08-14';

-- SELECT * FROM restaurant WHERE previous_visit >= '2018-08-14' and stars = 5;


SELECT * FROM restaurant ORDER BY distance;
SELECT * FROM restaurant ORDER BY distance LIMIT 2;
SELECT * FROM restaurant ORDER BY stars LIMIT 2;
SELECT * FROM restaurant WHERE distance < 2 ORDER BY stars LIMIT 2;
SELECT COUNT(*) FROM restaurant;
SELECT COUNT(category) FROM restaurant;
SELECT AVG(stars) AS average_stars FROM restaurant GROUP BY category;
SELECT MAX(stars) AS max_stars FROM restaurant GROUP BY category;




