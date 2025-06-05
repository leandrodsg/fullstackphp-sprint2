-- 01. Return the list of students ordered by first surname, second surname and name.
-- alunos ordenados por sobrenome 1 sobrenome 2 e nome ok
select nombre, apellido1, apellido2 
  from persona
 where tipo = 'alumno'
 order by apellido1, apellido2, nombre;

-- 02. Return the names of students born after 1999.
-- alunos que nasceram > 1999 ok
select nombre, apellido1, fecha_nacimiento 
  from persona
 where tipo = 'alumno' and fecha_nacimiento > '1999-12-31';

-- 03. Return the names of professors who have no phone number.
-- nomes professores sem telefone cadastrado ok
select nombre, apellido1 
  from persona
 where tipo = 'profesor' and telefono is null;

-- 04. Return the list of students whose NIF contains the letter K.
-- alunos que tem o K no NIF ok
select nombre, apellido1, nif 
  from persona
 where tipo = 'alumno' and nif like '%K%';

-- 05. Return the names of students enrolled in a third-year subject in the first semester.
-- alunos que cursaram disciplina do 3 ano no 1 semestre ok
select distinct p.nombre, p.apellido1 
  from persona p
  join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
  join asignatura a on a.id = ama.id_asignatura
 where a.curso = 3 and a.cuatrimestre = 1;

-- 06. Return the list of professors along with the department they belong to.
-- nomes professores com o departamento que pertencem
select prof.id_profesor, per.nombre, per.apellido1, d.nombre as departamento
  from profesor prof
  join persona per on prof.id_profesor = per.id
  join departamento d on prof.id_departamento = d.id;

-- 07. Return the list of subjects, start and end year for the student with NIF ‘26902806M’.
-- materias, ano início e ano fim do curso para aluno de NIF '26902806M' ok
select a.nombre as asignatura, ce.anyo_inicio, ce.anyo_fin
  from persona p
  join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
  join asignatura a on a.id = ama.id_asignatura
  join curso_escolar ce on ce.id = ama.id_curso_escolar
 where p.nif = '26902806M';

-- 08. Return the names of students enrolled in the 'Ingeniería Informática' degree.
-- alunos matriculados no curso de Engenharia Informática ok
select distinct p.nombre, p.apellido1
  from persona p
  join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
  join asignatura a on a.id = ama.id_asignatura
  join grado g on g.id = a.id_grado
 where g.nombre like '%Ingeniería Informática%';

-- 09. Return all students who were enrolled in the 2018/2019 school year.
-- todos os alunos matriculados no ano 2018/2019
select distinct p.nombre, p.apellido1
  from persona p
  join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
 where ama.id_curso_escolar = (select id 
                                 from curso_escolar 
                                where anyo_inicio = 2018 
                                  and anyo_fin = 2019);

-- 10. Return a list of professors and the department they belong to, if any.
-- professores com departamentos + os que nao tem departamento
-- professores na esquerda primeiro
select per.nombre, per.apellido1, d.nombre as departamento
  from persona per
  left join profesor prof on per.id = prof.id_profesor
  left join departamento d on prof.id_departamento = d.id
 where per.tipo = 'profesor';

-- 11. Return professors not assigned to any department.
-- professores que nao estao associados a nenhum departamento
-- mesma coisa, professores na esquerda
select per.nombre, per.apellido1
  from persona per
  left join profesor prof on per.id = prof.id_profesor
 where per.tipo = 'profesor' and prof.id_profesor is null;

-- 12. Return professors who have not taught any subject.
-- professores que não deram nenhuma aula
-- primeiro professor e depois as aulas
select per.nombre, per.apellido1
  from persona per
  join profesor prof on per.id = prof.id_profesor
  left join asignatura a on prof.id_profesor = a.id_profesor
 where a.id is null;

-- 13. Return subjects that do not have an assigned professor.
-- materias sem professor atribuido
select nombre 
  from asignatura
 where id_profesor is null;

-- 14. Return departments with no professors.
-- departamentos sem nenhum professor
-- right join com departamento no ok
select d.nombre 
  from departamento d
  right join profesor p on d.id = p.id_departamento
  where p.id_profesor is null;

-- 15. Return departments that did not teach any subject in any school year.
-- departamentos que nao deram nenhuma aula e nenhum ano letivo
-- right join nao funciona com departamento e nao sei pq no ok
select d.nombre
  from departamento d
  right join profesor p on d.id = p.id_departamento
  left join asignatura a on a.id_profesor = p.id_profesor
 where a.id is null;

-- 16. Return the total number of students.
-- num total de alunos ok
select count(*) as total_alunos 
  from persona 
 where tipo = 'alumno';

-- 17. Count how many students were born in 1999.
-- alunos nascidos em 99 ok
select count(*) as nascidos_1999 
  from persona 
 where tipo = 'alumno' and YEAR(fecha_nacimiento) = 1999;

-- 18. Count professors per department.
-- total professores por departamento
-- o count nao funciona, nao separa o campo
select d.nombre as departamento, count(p.id_profesor) as total_professores
  from departamento d
  left join profesor p on d.id = p.id_departamento;

-- 19. Average number of credits per subject.
-- media creditos por materia
select avg(creditos) as media_creditos
  from asignatura;

-- 20. Total subjects taught by each professor.
-- materias dadas por professor
-- having nao funciona
select per.nombre, per.apellido1, count(a.id) as total_materias
  from persona per
  join profesor prof on per.id = prof.id_profesor
  left join asignatura a on prof.id_profesor = a.id_profesor
  having total_materias > 1;

-- 21. Professor with most subjects taught.
-- professor que deu mais materias
-- count nao funciona
select max(count(a.id)) as total_materias
  from persona per
  join profesor prof on per.id = prof.id_profesor
  left join asignatura a on prof.id_profesor = a.id_profesor
  group by per.nombre, per.apellido1;

-- 22. Youngest professor (based on birth date).
-- professor mais jovem
select per.nombre, per.apellido1, per.fecha_nacimiento
  from persona per
  join profesor p on p.id_profesor = per.id
 order by per.fecha_nacimiento desc
 limit 1;


-- 23. Professors with department who did not teach any subject.
-- 23. Professores com departamento associado mas que não ministraram matérias.
-- subquery com professores que ministraram tambem e nao funciona! no ok
select per.nombre, per.apellido1, d.nombre as departamento
  from persona per
  join profesor prof on per.id = prof.id_profesor
  join departamento d on prof.id_departamento = d.id
 where prof.id_profesor in (select id_profesor 
                              from asignatura );