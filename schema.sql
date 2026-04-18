-- =====================================================
-- Feedback Management System - Database Schema
-- =====================================================

DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS users;

-- -----------------------------------------------------
-- Table: users
-- Stores registered users who can submit feedback.
-- -----------------------------------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table: feedback
-- Stores feedback messages submitted by users.
-- -----------------------------------------------------
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    rating INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key ensures each feedback belongs to a valid user.
    -- ON DELETE CASCADE removes feedback when the parent user is deleted.
    CONSTRAINT fk_feedback_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    -- Rating must stay in interview-friendly 1 to 5 range.
    CONSTRAINT chk_feedback_rating
        CHECK (rating BETWEEN 1 AND 5)
);
