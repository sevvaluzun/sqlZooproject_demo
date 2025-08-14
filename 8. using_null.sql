-- 1.
-- List the teachers who have NULL for their department.
-- Departmanı NULL olan öğretmenleri listeleyin.

SELECT name 
FROM teacher 
WHERE dept IS NULL;


-- 2.
-- INNER JOIN misses the teachers with no department and the departments with no teacher.
-- INNER JOIN departmanı olmayan öğretmenleri ve öğretmeni olmayan bölümleri listelemez.

SELECT teacher.name, dept.name
FROM teacher 
JOIN dept ON (teacher.dept = dept.id);


-- 3.
-- Use a different JOIN so that all teachers are listed.
-- Tüm öğretmenlerin listelenmesi için farklı bir JOIN kullanın.

SELECT teacher.name, dept.name 
FROM teacher 
LEFT JOIN dept ON (teacher.dept = dept.id);


-- 4.
-- Use a different JOIN so that all departments are listed.
-- Tüm bölümlerin listelenmesi için farklı bir JOIN kullanın.

SELECT teacher.name AS teacher_name, 
       dept.name AS department_name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;


-- 5.
-- Use COALESCE to print the mobile number. Use '07986 444 2266' if there is no number.
-- Mobil numara yoksa '07986 444 2266' değerini yazdırmak için COALESCE kullanın.

SELECT 
    name AS teacher_name,
    COALESCE(mobile, '07986 444 2266') AS mobile_number
FROM teacher;


-- 6.
-- Use COALESCE and LEFT JOIN to show teacher name and department name, 'None' if no department.
-- Öğretmen adı ve bölüm adını gösterin, bölüm yoksa 'None' yazın.

SELECT 
    teacher.name,
    COALESCE(dept.name, 'None') AS department_name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;


-- 7.
-- Use COUNT to show the number of teachers and the number of mobile phones.
-- Öğretmen sayısını ve mobil telefon sayısını gösterin.

SELECT 
    COUNT(name) AS number_of_teachers,
    COUNT(mobile) AS number_of_mobile_phones
FROM teacher;


-- 8.
-- Use COUNT and GROUP BY dept.name to show each department and the number of staff.
-- RIGHT JOIN kullanarak tüm bölümleri (Engineering dahil) listeleyin.

SELECT 
    dept.name AS department_name,
    COUNT(teacher.id) AS staff_count
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;


-- 9.
-- Use CASE to show teacher name followed by 'Sci' if dept = 1 or 2, 'Art' otherwise.
-- Dept 1 veya 2 ise 'Sci', diğerlerinde 'Art' yazın.

SELECT 
    name AS teacher_name,
    CASE 
        WHEN dept = 1 OR dept = 2 THEN 'Sci'
        ELSE 'Art'
    END AS department_category
FROM teacher;


-- 10.
-- Use CASE to show teacher name followed by:
-- 'Sci' if dept = 1 or 2, 'Art' if dept = 3, 'None' otherwise.
-- Dept 1-2 için 'Sci', Dept 3 için 'Art', diğerleri için 'None' yazın.

SELECT name,
    CASE
        WHEN dept = 1 OR dept = 2 THEN 'Sci'
        WHEN dept = 3 THEN 'Art'
        ELSE 'None'
    END AS department_category 
FROM teacher;
