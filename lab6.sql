/* 
Lab 6: Data Quality
Hayden Hoopes
*/

-- Query #1
-- Q. Does each item have an ARTIST_ROLE?
SELECT DISTINCT ARTIST_ROLE
    , COUNT(*) COUNT_OF_ITEMS_WITH_ARTIST_ROLE
FROM CLASS_DATASETS.MET_INVENTORY
GROUP BY ARTIST_ROLE
;
-- A. Not every item in the data set has an ARTIST_ROLE. There are 1017 items in
-- the data set that do not have an artist role.


-- Query #2
-- Q. Does this dataset have duplicate rows when looking at the TITLE and 
-- ARTIST_DISPLAY_NAME columns?
SELECT COUNT(*) NUMBER_OF_DUPLICATES
FROM
    (
        SELECT TITLE
            , ARTIST_DISPLAY_NAME
            , COUNT(*)
        FROM CLASS_DATASETS.MET_INVENTORY
        WHERE ARTIST_DISPLAY_NAME IS NOT NULL
        GROUP BY TITLE, ARTIST_DISPLAY_NAME
        HAVING COUNT(*) > 1
    )
;
-- A. There are 98 items in the data set whose TITLE and ARTIST_DISPLAY_NAME
-- attributes appear together more than once, not including items whose
-- ARTIST_DISPLAY_NAME is NULL.


-- Query #3
-- Q. What is the range of values in the ACCESSIONYEAR column?
SELECT MAX(ACCESSIONYEAR)-MIN(ACCESSIONYEAR) RANGE_OF_VALUES
    , MIN(ACCESSIONYEAR) EARLIEST_YEAR
    , MAX(ACCESSIONYEAR) MOST_RECENT_YEAR
    , COUNT(DISTINCT ACCESSIONYEAR) COUNT_OF_UNIQUE_YEARS
FROM CLASS_DATASETS.MET_INVENTORY
;
-- A. The range of the ACCESSIONYEAR column ranges between 1877 and 2018, or 141
-- years. There are 94 unique years in this column.


-- Query #4
-- Q. What values are possible in the IS_HIGHLIGHT column?
SELECT DISTINCT IS_HIGHLIGHT
    , COUNT(IS_HIGHLIGHT) COUNT_OF_IS_HIGHLIGHT
FROM CLASS_DATASETS.MET_INVENTORY
GROUP BY IS_HIGHLIGHT
;
DESC CLASS_DATASETS.MET_INVENTORY; -- Gets datatypes for each column.
-- A. The unique values in the IS_HIGHLIGHT column are F, TRUE, and FALSE.
-- The datatype for the column, however, is VARCHAR(100), which means that any
-- string that is less than 100 characters long is possible in the IS_HIGHLIGHT
-- column.


-- Query #5
-- Q. Does the OBJECT_DATE column contain valid years?
SELECT DISTINCT OBJECT_DATE VALID_YEARS_OF_OBJECT_DATE
FROM CLASS_DATASETS.MET_INVENTORY
WHERE LENGTH(OBJECT_DATE) = 4 -- Is the length 4?
    AND REGEXP_LIKE(OBJECT_DATE, '^[[:digit:]]+$') -- Is the string an integer?
    AND SUBSTR(OBJECT_DATE, 1, 2) IN ('16', '17', '18', '19', '20') -- Are the first two characters 16, 17, 18, 19, or 20?
ORDER BY OBJECT_DATE
;
-- A. There are, in fact, valid years in the OBJECT_DATE column.