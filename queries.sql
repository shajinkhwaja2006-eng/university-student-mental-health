-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Find the average depression score at each university
SELECT "name", ROUND(AVG("depression"), 2) AS "average_depression"
FROM "responses"
JOIN "universities" ON "universities"."id" = "university_id"
GROUP BY "name"
ORDER BY "average_depression" DESC;

--responses per university
SELECT "name", COUNT(*) AS "total_responses"
FROM "responses"JOIN "universities" ON "universities"."id" = "university_id"
GROUP BY "name"
ORDER BY "total_responses" DESC;

--Average anxiety by sleep group
SELECT "average_sleep", ROUND(AVG("anxiety"), 2) AS "average_anxiety"
FROM "responses"
GROUP BY "average_sleep";

-- Count how many students use each stress relief activity
SELECT "name", COUNT("response_activities"."response_id") AS "total_students"
FROM "stress_relief_activities"
LEFT JOIN "response_activities" ON "response_activities"."activity_id" = "stress_relief_activities"."id"
GROUP BY "stress_relief_activities"."name"
ORDER BY "total_students" DESC;

--Insert a new activity in stress relief activity
INSERT INTO "stress_relief_activities" ("name")
VALUES ('Music');

--Change/update the activity that you inserted
UPDATE "stress_relief_activities"
SET "name"= 'Art' WHERE "name"= 'Music';

--Remove the activity 'Art'
DELETE FROM "stress_relief_activities" WHERE "name"= 'Art';









