# Load database "amzn_review_toys"
# Switch "amzn_review_toys" to "amzn_review_sports" when analyzing the other dataset
USE amzn_review_toys;

# ******************** AVERAGE OF HELPFUL/TOTAL VOTES PER STAR RATING ******************** #
# Calculate average of helpful votes for each star rating
SELECT star_rating, AVG(helpful_votes)
FROM vine_table
GROUP BY star_rating;

# Calculate average of total votes for each star rating
SELECT star_rating, AVG(total_votes)
FROM vine_table
GROUP BY star_rating;

# ******************** HELPFUL VOTES STUDY SUBGROUPED BY TOTAL VOTES ******************** #
# Create views for total_votes-divided vine_table (tv = 0, 1, 2, 3(>=3))
CREATE VIEW vine_tv0 AS
SELECT total_votes, helpful_votes, vine
FROM vine_table
WHERE total_votes = 0;

CREATE VIEW vine_tv1 AS
SELECT total_votes, helpful_votes, vine
FROM vine_table
WHERE total_votes = 1;

CREATE VIEW vine_tv2 AS
SELECT total_votes, helpful_votes, vine
FROM vine_table
WHERE total_votes = 2;

CREATE VIEW vine_tv3 AS
SELECT total_votes, helpful_votes, vine
FROM vine_table
WHERE total_votes >= 3;

# Calculate average helpful votes in each total votes-divided group with vine equals to either "Y" or "N"
SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv0
WHERE vine = "Y";

SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv0
WHERE vine = "N";

SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv1
WHERE vine = "Y";

SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv1
WHERE vine = "N";

SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv2
WHERE vine = "Y";

SELECT CAST(AVG(total_votes) AS UNSIGNED) AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv2
WHERE vine = "N";

SELECT ">=3" AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv3
WHERE vine = "Y";

SELECT ">=3" AS total_votes, vine, AVG(helpful_votes)
FROM vine_tv3
WHERE vine = "N";