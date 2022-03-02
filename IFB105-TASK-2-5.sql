#Task 2
#Query 1
SELECT DISTINCT student_id, student_name, gender
FROM student
WHERE gender = "M";

#Query 2
SELECT staff_id
FROM taught_by
GROUP BY staff_id
HAVING count(unit_code)>2;

#Query 3
SELECT student_name
FROM TuteGroup
NATURAL JOIN TuteGroup_List
NATURAL JOIN student
WHERE unit_code = 'TNS01';

#Query 4
SELECT count(STUDENT_ID) numStudentsTaughtByS1
FROM Taught_by
NATURAL JOIN TuteGroup
NATURAL JOIN TuteGroup_List
WHERE staff_id = 'S1'
GROUP BY staff_id;

#Query 5
SELECT student_name,student_id,address,gender
FROM student
NATURAL JOIN TuteGroup_List
NATURAL JOIN Taught_by
WHERE weekday = 'Monday'
ORDER BY address;

#query 6
SELECT staff.*
FROM staff, taught_by, tuteGroup, tuteGroup_list
WHERE taught_by.unit_code = tutegroup.unit_code AND 
tutegroup.tuteGroup_code = tutegroup_list.tuteGroup_code AND
taught_by.staff_id = staff.staff_id
GROUP BY staff.staff_id HAVING count(tutegroup_list.student_id) > 6;SELECT * FROM AdditionCollege.Staff;

#Task 3#
#INSERT

INSERT INTO student (student_id, student_name, address, gender)
VALUES ((concat ('STD', '11')), "Sybil Stark", "302/28 Dengate Lane, St Lucia, QLD 4067", "F");

#DELETE
DELETE FROM staff
WHERE staff_id not in (SELECT (staff_id) FROM unit);

#Update
UPDATE staff
SET position="Senior Lecturer"
WHERE staffname LIKE '%Rostov';

#Task 4
#CREATE INDEX
CREATE INDEX student_index
ON student(student_name);

#CREATE VIEW
#DROP VIEW student_details;
CREATE VIEW student_details (student_name, student_id) AS
SELECT DISTINCT student_name, student_id
FROM student
NATURAL JOIN TuteGroup
NATURAL JOIN TuteGroup_List
WHERE room_nr = 'RM123';

#Task 5###
REVOKE INSERT ON staff FROM vanessa@localhost;
REVOKE DELETE ON staff FROM vanessa@localhost;
GRANT INSERT ON TuteGroup TO jessica@localhost;
GRANT DELETE ON TuteGroup TO jessica@localhost
