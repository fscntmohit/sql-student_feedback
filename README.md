# Feedback Management System

## Project Title
**Feedback Management System**

## Description
The Feedback Management System is a mini SQL project designed to collect and manage user feedback in a structured way.  
It solves a common problem in academic and training environments: storing feedback safely, linking each response to a user, and generating basic insights like average rating and top-rated feedback.

## Database Design Explanation
The database follows **relational design** and basic **normalization principles**:

- `users` table stores user identity details.
- `feedback` table stores feedback entries.
- A foreign key (`feedback.user_id`) creates a one-to-many relationship:
  - One user can submit multiple feedback entries.
  - Each feedback entry belongs to one user.

Key design practices used:
- Primary keys for uniqueness
- Unique constraint on email
- Foreign key with `ON DELETE CASCADE` for referential integrity
- `CHECK` constraint to keep rating between 1 and 5
- Timestamps for audit/readability

## Tables Overview

### 1) users
Stores user profile information.

Columns:
- `user_id` - Primary key, auto-increment
- `name` - User name (required)
- `email` - Unique email (required)
- `created_at` - Record creation timestamp

### 2) feedback
Stores feedback text and rating for each user.

Columns:
- `feedback_id` - Primary key, auto-increment
- `user_id` - Foreign key referencing `users.user_id`
- `message` - Feedback message (required)
- `rating` - Integer rating from 1 to 5
- `created_at` - Record creation timestamp

## Sample Queries Explanation
The `queries.sql` file includes practical, interview-friendly SQL operations:

### CRUD Queries
- Insert user
- Insert feedback
- Select all feedback with user details using `JOIN`
- Update feedback rating
- Delete feedback

### Analytical/Utility Queries
- Average rating per user using `GROUP BY`
- Top-rated feedback using subquery + `MAX(rating)`
- Filter by rating using `WHERE`
- Sort latest feedback using `ORDER BY created_at DESC`

## How to Run

### Option A: MySQL
1. Create a new database:
   - `CREATE DATABASE feedback_db;`
2. Select the database:
   - `USE feedback_db;`
3. Run schema script:
   - `SOURCE schema.sql;`
4. Run query script:
   - `SOURCE queries.sql;`

### Option B: PostgreSQL
This project uses mostly standard SQL. To run directly in PostgreSQL:

1. Create database:
   - `CREATE DATABASE feedback_db;`
2. Connect to database:
   - `\c feedback_db`
3. In `schema.sql`, replace:
   - `INT AUTO_INCREMENT` with `INT GENERATED ALWAYS AS IDENTITY`
4. Run scripts:
   - `\i schema.sql`
   - `\i queries.sql`

