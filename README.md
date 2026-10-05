Here is a complete and professional README.md template tailored for your Waste Collection and Management System project based on the provided code:
Waste Collection and Management System
Overview
The Waste Collection and Management System is a database-driven project designed to monitor, track, and manage waste bins, fill levels, waste weights, hotspot classifications, and collection statuses across different locations. Built using Oracle SQL and PL/SQL, the system automates priority calculations, status updates, location-based reporting, and robust exception handling.
Software & Environment Used
 * Database Management System: Oracle Database (SQL Developer)
 * Languages: SQL, PL/SQL
 * Dataset Size: 25 waste collection records
Database Schema: WASTE_COLLECTION
| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| bin_id | VARCHAR2(10) | PRIMARY KEY | Unique identifier for each waste bin |
| location | VARCHAR2(20) | NOT NULL | Zone/Location (East, South, North, West, Central) |
| waste_type | VARCHAR2(20) | NOT NULL | Type of waste (Organic, Plastic, Glass, Paper, Metal) |
| fill_level | NUMBER(5,2) | NOT NULL | Current fill percentage (0 to 100) |
| waste_weight | NUMBER(7,2) | NOT NULL | Weight of the waste in kilograms (\ge 0) |
| hotspot_level | VARCHAR2(10) | NOT NULL | Risk level (Low, Normal, Medium, High) |
| collection_status | VARCHAR2(15) | NOT NULL | Current status (Pending, Completed) |
| collection_date | DATE | — | Date when collection was completed (Null if Pending) |
Dataset Summary
The system initializes with 25 distinct records representing bins distributed across various locations with mixed waste categories, fill levels, and collection statuses.
 * Validation Constraints: Enforces strict business rules, ensuring fill levels stay within 0 to 100\%, weights remain positive, and collection dates align with their respective statuses.
Core SQL Queries
 * Display All Records: Retrieves complete details of all waste bins ordered by bin ID.
 * High Fill-Level Bins: Identifies bins with fill levels exceeding 80\% ordered by urgency.
 * Location Summary: Calculates the total number of bins, average fill levels, and total waste weight grouped by location.
 * Status Breakdown: Counts the total number of bins categorized by collection status (Pending vs. Completed).
 * High-Priority Pending Bins: Filters out bins flagged with a High hotspot level that are still pending collection.
PL/SQL Components
 * Function (fn_bin_priority): Evaluates a bin's fill level and returns a priority recommendation:
   * \ge 80\% \rightarrow URGENT
   * \ge 50\% \rightarrow SCHEDULE
   * Otherwise \rightarrow NORMAL
 * Procedure (sp_update_collection): Updates the collection status of a specified bin and automatically assigns the current date if marked as Completed.
 * Procedure (sp_location_report): Generates a formatted report displaying location-wise bin counts, average fill levels, total weights, and pending collections.
Exception Handling & Test Cases
The project includes comprehensive error handling covering multiple edge cases:
 * Test 1 & 2: Handling missing or NULL bin IDs in the priority function.
 * Test 3, 4 & 5: Catching invalid bin IDs, unrecognized statuses, and NULL parameters during status updates.
 * Test 6: Handling reports requested for non-existent locations.
 * Test 7: Primary key violation handling for duplicate bin IDs (DUP_VAL_ON_INDEX).
 * Test 8: Check constraint enforcement when fill levels exceed 100\%.
