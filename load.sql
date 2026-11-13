INSERT INTO "universities" ("name")
SELECT DISTINCT "university"
FROM "raw_survey";

INSERT INTO "degree_levels" ("name")
SELECT DISTINCT "degree_level"
FROM "raw_survey";

INSERT INTO "degree_majors" ("name")
SELECT DISTINCT "degree_major"
FROM "raw_survey";

INSERT INTO "academic_years" ("name")
SELECT DISTINCT "academic_year"
FROM "raw_survey";

INSERT INTO "cgpa_ranges" ("name")
SELECT DISTINCT "cgpa"
FROM "raw_survey";

INSERT INTO "responses" (
   "id", "university_id", "degree_level_id", "degree_major_id", "academic_year_id", "cgpa_range_id",
    "age", "gender", "residential_status", "campus_discrimination", "sports_engagement", "average_sleep",
    "study_satisfaction", "academic_workload", "academic_pressure", "financial_concerns",
    "social_relationships", "depression", "anxiety", "isolation", "future_insecurity"
)
SELECT
   "raw_survey"."rowid", "universities"."id", "degree_levels"."id", "degree_majors"."id", "academic_years"."id", "cgpa_ranges"."id",
    "raw_survey"."age", "raw_survey"."gender", "raw_survey"."residential_status",
    "raw_survey"."campus_discrimination", "raw_survey"."sports_engagement", "raw_survey"."average_sleep",
    "raw_survey"."study_satisfaction", "raw_survey"."academic_workload ", "raw_survey"."academic_pressure",
    "raw_survey"."financial_concerns", "raw_survey"."social_relationships", "raw_survey"."depression",
    "raw_survey"."anxiety", "raw_survey"."isolation", "raw_survey"."future_insecurity"
FROM "raw_survey"
JOIN "universities" ON "universities"."name" = "raw_survey"."university"
JOIN "degree_levels" ON "degree_levels"."name" = "raw_survey"."degree_level"
JOIN "degree_majors" ON "degree_majors"."name" = "raw_survey"."degree_major"
JOIN "academic_years" ON "academic_years"."name" = "raw_survey"."academic_year"
JOIN "cgpa_ranges" ON "cgpa_ranges"."name" = "raw_survey"."cgpa";

INSERT INTO "stress_relief_activities" ("name")
VALUES
    ('Religious Activities'),
    ('Social Connections'),
    ('Online Entertainment'),
    ('Sports and Fitness'),
    ('Outdoor Activities'),
    ('Nothing'),
    ('Creative Outlets'),
    ('Sleep');

INSERT INTO "response_activities" ("response_id", "activity_id")
    SELECT "rowid", (
    SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Religious Activities'
    )
    FROM "raw_survey"
    WHERE "stress_relief_activities" LIKE '%Religious Activities%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Social Connections')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Social Connections%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Online Entertainment')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Online Entertainment%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Sports and Fitness')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Sports and Fitness%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Outdoor Activities')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Outdoor Activities%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Nothing')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Nothing%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Creative Outlets')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Creative Outlets%';

INSERT INTO "response_activities" ("response_id", "activity_id")
SELECT "rowid", (SELECT "id" FROM "stress_relief_activities" WHERE "name" = 'Sleep')
FROM "raw_survey"
WHERE "stress_relief_activities" LIKE '%Sleep%';
