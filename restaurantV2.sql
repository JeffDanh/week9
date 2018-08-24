-- CREATE TABLE restaurant(
--     id serial PRIMARY KEY,
--     name varchar,
--     address varchar,
--     category varchar
-- );

-- CREATE TABLE reviewer(
--     id serial PRIMARY KEY,
--     name varchar,
--     email varchar,
--     karma integer check(karma >=0 and karma <=7)
-- );

-- CREATE TABLE review(
--     id serial PRIMARY KEY,
--     reviewer_id integer REFERENCES reviewer(id),
--     stars integer check(stars >= 1 and stars <= 5),
--     title varchar,
--     review varchar,
--     restaurant_id integer REFERENCES restaurant(id)
-- );

-- INSERT INTO restaurant(name, address, category) VALUES ('Huynh Restaurant', '912 St Emanuel St, Houston, TX ', 'Vietnamese');
-- INSERT INTO restaurant(name, address, category) VALUES ('Bullritos', '4701 Calhoun Rd, Houston, TX', 'Mexican');
-- INSERT INTO restaurant(name, address, category) VALUES ('Seaside Poke', '2118 Lamar St #101, Houston, TX', 'Raw Fish');

-- INSERT INTO reviewer(name, email, karma) VALUES ('Jeff', 'jeff3d@gmail.com', 5);
-- INSERT INTO reviewer(name, email, karma) VALUES ('Bob', 'bob123456@gmail.com', 4);
-- INSERT INTO reviewer(name, email, karma) VALUES ('Jennifer', 'jennrocketleague@gmail.com', 7);

-- INSERT INTO review(reviewer_id, stars, title, review, restaurant_id) VALUES (1, 5, 'Decent', 'The food was pretty good considering the price.', 2);
-- INSERT INTO review(reviewer_id, stars, title, review, restaurant_id) VALUES (2, 3, 'Meh', 'The food was alright', 3);
-- INSERT INTO review(reviewer_id, stars, title, review, restaurant_id) VALUES (3, 2, 'Bad', 'food was bad, service was bad, place was trash', 1);

SELECT * FROM review WHERE restaurant_id = 1;

SELECT review.*, restaurant.name FROM review OUTER JOIN restaurant ON review.restaurant_id = restaurant.id WHERE restaurant.name = 'Huynh Restaurant';

SELECT * FROM review LEFT OUTER JOIN reviewer ON review.reviewer_id = reviewer.id WHERE reviewer.name = 'Jeff';

SELECT review.review, restaurant.name FROM review LEFT OUTER JOIN restaurant ON restaurant.id = review.restaurant_id;

SELECT restaurant.name, AVG(review.stars) FROM restaurant, review WHERE review.restaurant_id = restaurant.id GROUP BY restaurant.name;

SELECT restaurant.name, COUNT(review.id) FROM restaurant LEFT OUTER JOIN review ON restaurant.id = review.restaurant_id;

SELECT review.review, restaurant.name, reviewer.name FROM review FULL OUTER JOIN restaurant ON review.restaurant_id = restaurant.id LEFT OUTER JOIN reviewer ON review.reviewer_id = reviewer.id;

SELECT reviewer.name, AVG(review.stars) FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id;

SELECT reviewer.name, MIN(review.stars) FROM reviewer INNER JOIN review ON reviewer.id = review.reviewer_id;

SELECT restaurant.category, COUNT(restaurant.category) FROM restaurant GROUP BY restaurant.category;

SELECT restaurant.name, review.stars FROM restaurant FULL OUTER JOIN review ON restaurant.id = review.restaurant_id WHERE review.stars = 5 GROUP BY restaurant.name;

SELECT restaurant.category, AVG(review.stars) FROM review INNER JOIN restaurant ON review.restaurant_id = restaurant.id GROUP BY restaurant.category;
