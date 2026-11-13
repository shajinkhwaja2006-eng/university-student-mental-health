# University Student Mental Health

By Shajin khwaja

Video overview: https://youtu.be/Ff0fPnpriNA

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
The purpose of my database is to store the results of a student mental health survey so that the data can be searched and compared easily. For example, someone can look at how depression or anxiety scores change between universities, degree majors, or sleep habits.

* Which people, places, things, etc. are you including in the scope of your database?
The database contains survey responses from 87 students. It includes basic information about each student, such as their age,gender, university, degree, major, academic year, CGPA range, and living situation. It also has information about their college life, like whether they have faced discrimination, play sports, and how much they sleep. Students also rated things like study satisfaction, workload, academic pressure, financial stress, social relationships, depression, anxiety, loneliness, and worries about their future. The database also shows what activities students do to manage their stress.

* Which people, places, things, etc. are *outside* the scope of your database?
The database does not have students' names, IDs, or any other information that could identify them because these details were not included in the dataset. It also does not have any dates, so we cannot track how a student's stress or mental health changes over time.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
A user should be able to explore the survey results and compare students in different groups. For example, they can see which universities have the highest average depression or anxiety scores, how many students answered from each university, and whether students who sleep fewer hours report more anxiety. They can also check which stress relief activities students use most often. On top of reading the data, a user can add a new stress relief activity, change the name of an existing one, or remove one that is no longer needed.

* What's beyond the scope of what a user should be able to do with your database?
A user cannot find out who a student is, because responses are anonymous. A user also cannot track the same student across more than one survey, since the database only stores one survey.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
My database has 8 tables.
universities, degree levels, degree majors, academic years and cgpa ranges are lookup tables. Each one has an id and a name. Stress relief activities store each activity once, with an id and a name. Rresponses is the main table snd each row is one anonymous survey response. Response activities is a table that links responses to activities is a table that links responses to activities.

* What attributes will those entities have?
The responses table has an id,  five foreign keys (university_id, degree level id, degree major id, academic year id, cgpa range id,), the students age, gender, residential status, campus discrimination, sports engagement and average sleep. There are also nine rating columns(study satisfaction, academic workload, academic pressure, financial concerns, social relationships, depression, anxiety, isolation and future insecurity). The response activities table has two columns, (response id and activity id)

* Why did you choose the types you did?
I used INTEGER for ids, age and ratings because they are whole numbers and i want to calculate averages with them. I used TEXT for names and for columns like gender and sleep as they are words or ranges(example "4-6 hrs")

* Why did you choose the constraints you did?
Every column has a PRIMARY KEY on id so each row can be identified.
 The name columns in the lookup tables are NOT NULL and UNIQUE so no value is saved without a name or saved twice.
 I used FOREIGN KEY constraints so a response can only point to a university, major, year or CGPA range that actually exists.
 I used CHECK constraints on gender, residential status, campus discrimination, sports engagement and average sleep because they only have a few values and a CHECK can keep bad data out without needing more tables.


### Relationships
![ER diagram](DIAGRAM.png)

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

Each lookup table (universities, degree levels, degree majors, academic years and cgpa ranges) have one to many relationship with RESPONSES. One university can have many responses but each response belongs to only one university. The same is true for the other four.
Responses and Stress relief activities have many to many relationship, because one student can use several activities and one activity can have many students.A table can't hold this directly so i used Response activities in the middle. It has one row for each pair of response and activity.


## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
I  created three indexes on the responses table on `university id`, `degree_major_id` and `average_sleep`. I chose them because my queries often join or group by these columns, so the indexes make those searches faster.
I also created a view called `response_details`. It joins `responses` with `universities` and `degree_majors` and shows the university name, the major name, and the depression, anxiety, and academic pressure scores. I made it so I do not have to write the same two joins again and again.

## Limitations
In this section you should answer the following questions:

* What are the limitations of your design?
The database only has 87 responses, so it is too small to say much about all students. It also comes from one survey with no dates, so it cannot show changes over time or follow the same student more than once.
As responses are anonymous, I cannot tell if two rows came from the same person. The stress relief activities were stored as text in one cell in the original file, so I split them by matching activity names. If an activity were spelled differently in the data, it would have been missed. I also stored "Nothing" as an activity so that students who chose it are still counted, even though it is not really an activity.

* What might your database not be able to represent very well?
It can't represent the exact CGPA, sleep hours or sports activity, only the ranges the survey used. The activity "Nothing" is stored like any other activity, even though it means the student has no activity. It also can't show why a student gave a certain rating, because the survey has no written answers.
