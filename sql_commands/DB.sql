1- Get all data from the groups:

SELECT * FROM becodedatabase.students;

2- Get the name and email of the first learner, and alias the name to learner_name:

SELECT name, lastName, email FROM becodedatabase.students WHERE studentId = 2;

3- happens - a group needs to be postponed
Update the start date of the first_group (make it two months later)*
Introduce a new field status which can contain a long text indicating the reason for postponing (bonus points if it's a creative one)
One of the learners changed his/her mind and decided to be an astronaut
Delete someone from the learners table.

UPDATE `becodedatabase`.`courses` SET `startDate` = '2022-02-15 00:00:00', `endDate` = '2022-09-10 00:00:00' WHERE (`courseId` = '3') and (`beCode_beCodeId` = '1');