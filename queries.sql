-- =====================================================
-- Feedback Management System - Sample Queries
-- =====================================================
-- -----------------------------------------------------
-- CRUD OPERATIONS
-- -----------------------------------------------------

-- 1) INSERT USER
INSERT INTO users (name, email)
VALUES ('Aarav Mehta', 'aarav.mehta@example.com');

-- 2) INSERT FEEDBACK
-- Assumes user_id = 1 exists.
INSERT INTO feedback (user_id, message, rating)
VALUES (1, 'The training sessions were clear and practical.', 5);

-- 3) SELECT ALL FEEDBACK WITH USER DETAILS (JOIN)
SELECT
    f.feedback_id,
    u.user_id,
    u.name,
    u.email,
    f.message,
    f.rating,
    f.created_at AS feedback_created_at
FROM feedback AS f
INNER JOIN users AS u
    ON f.user_id = u.user_id;

-- 4) UPDATE FEEDBACK RATING
-- Update rating for a specific feedback entry.
UPDATE feedback
SET rating = 4
WHERE feedback_id = 1;

-- 5) DELETE FEEDBACK
DELETE FROM feedback
WHERE feedback_id = 1;

-- -----------------------------------------------------
-- ADDITIONAL QUERIES
-- -----------------------------------------------------

-- 6) GET AVERAGE RATING PER USER (GROUP BY)
SELECT
    u.user_id,
    u.name,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    COUNT(f.feedback_id) AS total_feedback_count
FROM users AS u
INNER JOIN feedback AS f
    ON u.user_id = f.user_id
GROUP BY u.user_id, u.name
ORDER BY avg_rating DESC;

-- 7) GET TOP-RATED FEEDBACK
-- Returns all feedback rows with the maximum rating value.
SELECT
    f.feedback_id,
    u.name,
    f.message,
    f.rating,
    f.created_at
FROM feedback AS f
INNER JOIN users AS u
    ON f.user_id = u.user_id
WHERE f.rating = (
    SELECT MAX(rating)
    FROM feedback
);

-- 8) FILTER FEEDBACK BY RATING (WHERE CLAUSE)
SELECT
    feedback_id,
    user_id,
    message,
    rating,
    created_at
FROM feedback
WHERE rating >= 4;

-- 9) SORT FEEDBACK BY LATEST (ORDER BY)
SELECT
    feedback_id,
    user_id,
    message,
    rating,
    created_at
FROM feedback
ORDER BY created_at DESC;
