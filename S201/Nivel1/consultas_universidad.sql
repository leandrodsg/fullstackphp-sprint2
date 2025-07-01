-- 1. return a list with first surname, second surname and name of all students.
-- the list must be ordered by first surname, second surname and name (ascending).
select apellido1, apellido2, nombre
from persona
where tipo = 'alumno'
order by apellido1 asc, apellido2 asc, nombre asc;


-- 2. get the name and both surnames of students who did not delete their phone number.
-- that is: students with a non-null phone number.
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno'
  and telefono is not null;


-- 3. return the list of students who were born in 1999.
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno'
  and year(fecha_nacimiento) = 1999;


-- 4. return the list of professors who did not delete their phone number
-- and whose nif ends with 'k'.
select nombre, apellido1, apellido2, nif
from persona
where tipo = 'profesor'
  and telefono is not null
  and nif like '%k';


-- 5. return the list of subjects given in the first semester,
-- in the third course of the degree with id = 7.
select nombre
from asignatura
where cuatrimestre = 1
  and curso = 3
  and id_grado = 7;


-- 6. return a list of professors with the name of the department they belong to.
-- the list must have: first surname, second surname, name, department name.
-- ordered by surnames and name ascending.
select p.apellido1, p.apellido2, p.nombre, d.nombre as department_name
from persona p
join profesor prof on p.id = prof.id_profesor
join departamento d on prof.id_departamento = d.id
where p.tipo = 'profesor'
order by p.apellido1 asc, p.apellido2 asc, p.nombre asc;


-- 7. return a list with the name of the subjects,
-- start year and end year of the school year for the student with nif '26902806m'.
select a.nombre as subject_name, ce.anyo_inicio as start_year, ce.anyo_fin as end_year
from persona p
join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
join asignatura a on a.id = ama.id_asignatura
join curso_escolar ce on ce.id = ama.id_curso_escolar
where p.nif = '26902806m';


-- 8. return a list with the name of all departments
-- that have professors and teach at least one subject in 'ingeniería informática (plan 2015)'.
select distinct d.nombre as department_name
from departamento d
join profesor prof on d.id = prof.id_departamento
join asignatura a on prof.id_profesor = a.id_profesor
join grado g on a.id_grado = g.id
where g.nombre like '%ingeniería informática (plan 2015)%';


-- 9. return a list with all students who were enrolled in any subject
-- during the 2018/2019 school year.
select distinct p.nombre, p.apellido1, p.apellido2
from persona p
join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
join curso_escolar ce on ama.id_curso_escolar = ce.id
where ce.anyo_inicio = 2018 and ce.anyo_fin = 2019;




-- 1. return a list with the names of all professors and the departments they are linked to.
-- the list must also show professors who have no department.
-- columns: department name, first surname, second surname, professor name.
-- ordered by department name, surnames and name ascending.
select d.nombre as department_name,
       p.apellido1,
       p.apellido2,
       p.nombre as professor_name
from persona p
left join profesor prof on p.id = prof.id_profesor
left join departamento d on prof.id_departamento = d.id
where p.tipo = 'profesor'
order by d.nombre asc, p.apellido1 asc, p.apellido2 asc, p.nombre asc;


-- 2. return a list of professors who are not linked to any department.
select p.apellido1,
       p.apellido2,
       p.nombre as professor_name
from persona p
left join profesor prof on p.id = prof.id_profesor
where p.tipo = 'profesor'
  and prof.id_departamento is null;


-- 3. return a list of departments that have no professors.
select d.nombre as department_name
from departamento d
left join profesor prof on d.id = prof.id_departamento
where prof.id_profesor is null;


-- 4. return a list of professors who do not teach any subject.
select p.apellido1,
       p.apellido2,
       p.nombre as professor_name
from persona p
join profesor prof on p.id = prof.id_profesor
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;


-- 5. return a list of subjects that do not have an assigned professor.
select nombre as subject_name
from asignatura
where id_profesor is null;


-- 6. return a list of all departments that did not teach any subject in any school year.
select distinct d.nombre as department_name
from departamento d
left join profesor prof on d.id = prof.id_departamento
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;



-- 1. return the total number of students.
select count(*) as total_students
from persona
where tipo = 'alumno';


-- 2. count how many students were born in 1999.
select count(*) as students_born_1999
from persona
where tipo = 'alumno'
  and year(fecha_nacimiento) = 1999;


-- 3. count how many professors there are in each department.
-- show two columns: department name and number of professors.
-- include only departments that have professors.
-- order by number of professors descending.
select d.nombre as department_name,
       count(prof.id_profesor) as total_professors
from departamento d
join profesor prof on d.id = prof.id_departamento
group by d.nombre
order by total_professors desc;


-- 4. return a list with all departments and the number of professors in each.
-- include departments with zero professors.
select d.nombre as department_name,
       count(prof.id_profesor) as total_professors
from departamento d
left join profesor prof on d.id = prof.id_departamento
group by d.nombre
order by total_professors desc;


-- 5. return a list with the name of all degrees and the number of subjects each has.
-- include degrees with zero subjects.
-- order by number of subjects descending.
select g.nombre as degree_name,
       count(a.id) as total_subjects
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
order by total_subjects desc;


-- 6. return a list with the name of all degrees and the number of subjects each has,
-- but only degrees with more than 40 subjects.
select g.nombre as degree_name,
       count(a.id) as total_subjects
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
having total_subjects > 40
order by total_subjects desc;


-- 7. return a list showing the degree name, type of subject and total credits per type.
-- columns: degree name, subject type, sum of credits.
select g.nombre as degree_name,
       a.tipo as subject_type,
       sum(a.creditos) as total_credits
from asignatura a
join grado g on a.id_grado = g.id
group by g.nombre, a.tipo;


-- 8. return a list showing how many students were enrolled in any subject in each school year.
-- columns: start year and number of enrolled students.
select ce.anyo_inicio as start_year,
       count(distinct ama.id_alumno) as total_students
from alumno_se_matricula_asignatura ama
join curso_escolar ce on ama.id_curso_escolar = ce.id
group by ce.anyo_inicio
order by ce.anyo_inicio asc;


-- 9. return a list with the number of subjects taught by each professor.
-- include professors who teach zero subjects.
-- columns: id, name, first surname, second surname, number of subjects.
-- order by number of subjects descending.
select prof.id_profesor,
       p.nombre,
       p.apellido1,
       p.apellido2,
       count(a.id) as total_subjects
from profesor prof
join persona p on prof.id_profesor = p.id
left join asignatura a on prof.id_profesor = a.id_profesor
group by prof.id_profesor, p.nombre, p.apellido1, p.apellido2
order by total_subjects desc;


-- 10. return all data of the youngest student.
select *
from persona
where tipo = 'alumno'
order by fecha_nacimiento desc
limit 1;


-- 11. return a list of professors who have a department linked but do not teach any subject.
select p.apellido1,
       p.apellido2,
       p.nombre as professor_name,
       d.nombre as department_name
from persona p
join profesor prof on p.id = prof.id_profesor
join departamento d on prof.id_departamento = d.id
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;