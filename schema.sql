-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
---- Lookup table that lists every university once
CREATE TABLE "universities" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

-- Lookup table of degree_levels that lists every university once
CREATE TABLE "degree_levels" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Lookup table that lists every degree_major once
CREATE TABLE "degree_majors" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Lookup table that lists each academic year once
CREATE TABLE "academic_years" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Lookup table that lists every cgpa range once
CREATE TABLE "cgpa_ranges" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Lookup table that lists each stress relief activity once
CREATE TABLE "stress_relief_activities" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

--Links each response to the stress relief activities the student uses
CREATE TABLE "response_activities" (
    "response_id" INTEGER,
    "activity_id" INTEGER,
    PRIMARY KEY ("response_id", "activity_id"),
    FOREIGN KEY ("response_id") REFERENCES "responses"("id"),
    FOREIGN KEY ("activity_id") REFERENCES "stress_relief_activities"("id")
);

-- Main table that stores one anonymous survey response per row
CREATE TABLE "responses" (
    "id" INTEGER,
    "university_id" INTEGER,
    "degree_level_id" INTEGER,
    "degree_major_id" INTEGER,
    "academic_year_id" INTEGER,
    "cgpa_range_id" INTEGER,
    "age" INTEGER,
    "gender" TEXT NOT NULL CHECK("gender" IN ('Male', 'Female')),
    "residential_status" TEXT NOT NULL CHECK("residential_status" IN ('On-Campus', 'Off-Campus')),
    "campus_discrimination" TEXT NOT NULL CHECK("campus_discrimination" IN ('Yes', 'No')),
    "sports_engagement" TEXT NOT NULL CHECK("sports_engagement" IN ('No Sports', '1-3 times', '4-6 times', '7+ times')),
    "average_sleep" TEXT NOT NULL CHECK("average_sleep" IN ('2-4 hrs', '4-6 hrs', '7-8 hrs')),
    "study_satisfaction" INTEGER,
    "academic_workload" INTEGER,
    "academic_pressure" INTEGER,
    "financial_concerns" INTEGER,
    "social_relationships" INTEGER,
    "depression" INTEGER,
    "anxiety" INTEGER,
    "isolation" INTEGER,
    "future_insecurity" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("university_id") REFERENCES "universities"("id"),
    FOREIGN KEY ("degree_level_id") REFERENCES "degree_levels"("id"),
    FOREIGN KEY ("degree_major_id") REFERENCES "degree_majors"("id"),
    FOREIGN KEY ("academic_year_id") REFERENCES "academic_years"("id"),
    FOREIGN KEY ("cgpa_range_id") REFERENCES "cgpa_ranges"("id")
);

-- Speeds up joins and searches by university
CREATE INDEX "responses_university_index" ON "responses"("university_id");

-- Speeds up joins and searches by degree major
CREATE INDEX "responses_degree_major_index" ON "responses"("degree_major_id");

-- Speeds up grouping and searching by sleep hours
CREATE INDEX "responses_average_sleep_index" ON "responses"("average_sleep");

-- Shows each response with readable university and major names and key scores
CREATE VIEW "response_details" AS
SELECT
    "universities"."name" AS "university",
    "degree_majors"."name" AS "degree_major",
    "responses"."depression",
    "responses"."anxiety",
    "responses"."academic_pressure"
FROM "responses"
JOIN "universities" ON "universities"."id" = "responses"."university_id"
JOIN "degree_majors" ON "degree_majors"."id" = "responses"."degree_major_id";
