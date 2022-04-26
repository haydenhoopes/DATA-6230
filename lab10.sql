-- Lab 10
-- Hayden Hoopes

-- 1. Write the SQL code to create the table below named LAB10_Production_Studio
CREATE TABLE LAB10_Production_Studio (
    STUDIO_ID NUMBER PRIMARY KEY,
    STUDIO_NAME VARCHAR2(50) NOT NULL,
    PRODUCTION_LOCATION VARCHAR2(50) CONSTRAINT valid_location
        CHECK (PRODUCTION_LOCATION IN ('US', 'UK', 'Germany'))
);


-- 2. Write the SQL code to create the table below named LAB10_Movie.
CREATE TABLE LAB10_Movie (
    MOVIE_ID NUMBER PRIMARY KEY,
    MOVIE_TITLE VARCHAR2(50) NOT NULL,
    STUDIO_ID CONSTRAINT fk_studioid
        REFERENCES LAB10_Production_Studio(STUDIO_ID),
    BUDGET NUMBER,
    RUNTIME_MINUTES NUMBER CONSTRAINT valid_runtime
        CHECK (RUNTIME_MINUTES < 500)
);

-- 3. Write the SQL code to enter the following records into your production
--    studio table.
INSERT INTO LAB10_Production_Studio
    VALUES (1, 'Pixar Animation Studios', 'US')
;
INSERT INTO LAB10_Production_Studio
    VALUES (2, 'Warner Bros.', 'US')
;
INSERT INTO LAB10_Production_Studio
    VALUES (3, 'Columbia Pictures Corporation', 'UK')
;


-- 4. Write the SQL code to enter the following records into your movie table.
INSERT INTO LAB10_Movie
    VALUES (100, 'Toy Story', 1, 30000000, 81)
;
INSERT INTO LAB10_Movie
    VALUES (101, 'Grumpy Old Men', 2, 0, 103)
;


-- 5. Use a subquery to insert the rows from the CLASS_DATASETS.MOVIES_INSERT 
--    table. You should only insert movies with a MOVIE_ID less than 100.
INSERT INTO LAB10_Movie
     SELECT *
     FROM CLASS_DATASETS.MOVIES_INSERT
WHERE MOVIE_ID < 100;


-- 6. Write the SQL that will save the cahnges made to these tables.
COMMIT;


-- 7. Write the SQL code to change the budget of movies listed with 0 to 1.
UPDATE LAB10_Movie
SET BUDGET = 1
WHERE BUDGET = 0
;


-- 8. Write the SQL code to delete the row for the movie titled "Little Women".
DELETE FROM LAB10_Movie
WHERE MOVIE_TITLE = 'Little Women'
;


-- 9. Write the SQL code to create a copy of LAB10_Movie, including all of its 
--    data, and naming the copy LAB10_MOVIE2.
CREATE TABLE LAB10_Movie2 AS
    SELECT *
    FROM LAB10_Movie
;


-- 10. Using the LAB10_MOVIE2 table, write the SQL code that add an attribute 
--     for BUDGET_PER_MINUTE as a NUMBER data type.
ALTER TABLE LAB10_Movie2
ADD BUDGET_PER_MINUTE NUMBER
;


-- 11. Using the LAB10_MOVIE2 table, write the SQL code to change the 
--     BUDGET_PER_MINUTE value to the calculation of BUDGET / RUNTIME_MINUTES.
UPDATE LAB10_Movie2
SET BUDGET_PER_MINUTE = BUDGET / RUNTIME_MINUTES
;


-- 12. Using the LAB10_MOVIE2 table, write the SQL code to change the 
--     BUDGET_PER_MINUTE value to 1 for the movies with a MOVID_ID of 3 and 101.
UPDATE LAB10_Movie2
SET BUDGET_PER_MINUTE = 1
WHERE MOVIE_ID IN (3, 101)
;


-- 13. Rollback your changes
ROLLBACK;
