-- You may want to first create a new database (schema) for this assignment.
-- My SCHEMA is called videos.
-- 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
-- video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
-- other publicly available resources.

DROP TABLE IF EXISTS tblVideos;
-- Create table Videos
CREATE TABLE tblVideos
(
  video_id int PRIMARY KEY,
  title varchar(80) NOT NULL,
  lenght decimal(5,2) NOT NULL,
  url varchar(100) NOT NULL
);
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 1, 'MySql Tutorial: CREATE database, table & INSERT VALUE', 10.38 , 'https://www.youtube.com/watch?v=XJ7dlwHuVUk');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 2, 'Create MySQL Database - MySQL Workbench Tutorial', 17.14 , 'https://www.youtube.com/watch?v=K6w0bZjl_Lw');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 3, 'MySQL Tutorial for Beginners - 1 - Creating a Database and Adding Tables to it', 8.49 , 'https://www.youtube.com/watch?v=FAXhXI2Gxdc');

SELECT * FROM tblVideos;

-- 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
-- at least two of the videos. These should be imaginary reviews that include columns for the user’s name
-- (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
-- (“Loved it!”). There should be a column that links back to the ID column in the table of videos

DROP TABLE IF EXISTS tblReviews;
 
 -- Create table tblReviews
CREATE TABLE tblReviews
(
  review_id int PRIMARY KEY,
  video_id int NOT NULL REFERENCES tblVideos,
  user_name varchar(30) NOT NULL,
  rating int,
  review varchar(30) NOT NULL
);

INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (1, 1, 'Forhad', 5, 'Great video');
INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (2, 1, 'Faisal', 4, 'Super helpful');
INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (3, 2, 'Apollo', 5, 'Informative');
INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (4, 2, 'Jeb', 5, 'Happy learning');
INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (5, 3, 'Brad', 5, 'Thank you');
INSERT INTO tblReviews (review_id, video_id, user_name, rating, review) VALUES (6, 3, 'Harshad', NULL, 'Amazing');

SELECT * FROM tblReviews;

-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

SELECT 
V.title As 'Title',
V.lenght AS 'Lenght',
V.url AS 'URL',
R.user_name As 'User',
R.rating As 'Rating',
R.review AS 'Review'
FROM tblVideos AS V
JOIN tblReviews AS R
ON V.video_id = R.video_id;