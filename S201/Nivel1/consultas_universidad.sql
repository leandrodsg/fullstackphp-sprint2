-- 1. Retorna una llista amb el primer cognom, el segon cognom i el nom de tots els alumnes.
-- La llista ha d'estar ordenada per primer cognom, segon cognom i nom (ascendent).
select apellido1, apellido2, nombre
from persona
where tipo = 'alumno'
order by apellido1 asc, apellido2 asc, nombre asc;

-- 2. Obté el nom i els dos cognoms dels alumnes que no han eliminat el seu telèfon.
-- És a dir: alumnes amb telèfon no nul.
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno'
  and telefono is not null;

-- 3. Retorna la llista d'alumnes nascuts l'any 1999.
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno'
  and year(fecha_nacimiento) = 1999;

-- 4. Retorna la llista de professors que no han eliminat el seu telèfon
-- i el seu nif acaba en 'k'.
select nombre, apellido1, apellido2, nif
from persona
where tipo = 'profesor'
  and telefono is not null
  and nif like '%k';

-- 5. Retorna la llista d'assignatures impartides en el primer quadrimestre,
-- en el tercer curs del grau amb id = 7.
select nombre
from asignatura
where cuatrimestre = 1
  and curso = 3
  and id_grado = 7;

-- 6. Retorna una llista de professors amb el nom del departament al qual pertanyen.
-- La llista ha de tenir: primer cognom, segon cognom, nom, nom del departament.
-- Ordenada per cognoms i nom de forma ascendent.
select p.apellido1, p.apellido2, p.nombre, d.nombre as nombre_departamento
from persona p
join profesor prof on p.id = prof.id_profesor
join departamento d on prof.id_departamento = d.id
where p.tipo = 'profesor'
order by p.apellido1 asc, p.apellido2 asc, p.nombre asc;

-- 7. Retorna una llista amb el nom de les assignatures,
-- any d'inici i fi del curs acadèmic per a l'alumne amb nif '26902806m'.
select a.nombre as nombre_asignatura, ce.anyo_inicio as anyo_inicio, ce.anyo_fin as anyo_fin
from persona p
join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
join asignatura a on a.id = ama.id_asignatura
join curso_escolar ce on ce.id = ama.id_curso_escolar
where p.nif = '26902806m';

-- 8. Retorna una llista amb el nom de tots els departaments
-- que tenen professors i imparteixen almenys una assignatura del grau 'ingeniería informática (plan 2015)'.
select distinct d.nombre as nombre_departamento
from departamento d
join profesor prof on d.id = prof.id_departamento
join asignatura a on prof.id_profesor = a.id_profesor
join grado g on a.id_grado = g.id
where g.nombre like '%ingeniería informática (plan 2015)%';

-- 9. Retorna una llista amb tots els alumnes matriculats en alguna assignatura
-- durant el curs 2018/2019.
select distinct p.nombre, p.apellido1, p.apellido2
from persona p
join alumno_se_matricula_asignatura ama on p.id = ama.id_alumno
join curso_escolar ce on ama.id_curso_escolar = ce.id
where ce.anyo_inicio = 2018 and ce.anyo_fin = 2019;

-- 1. Retorna una llista amb el nom de tots els professors i els departaments als quals estan vinculats.
-- La llista també ha de mostrar professors sense departament.
-- Columnes: nom departament, primer cognom, segon cognom, nom professor.
-- Ordenada per nom departament, cognoms i nom ascendent.
select d.nombre as nombre_departamento,
       p.apellido1,
       p.apellido2,
       p.nombre as nombre_profesor
from persona p
left join profesor prof on p.id = prof.id_profesor
left join departamento d on prof.id_departamento = d.id
where p.tipo = 'profesor'
order by d.nombre asc, p.apellido1 asc, p.apellido2 asc, p.nombre asc;

-- 2. Retorna una llista de professors que no estan vinculats a cap departament.
select p.apellido1,
       p.apellido2,
       p.nombre as nombre_profesor
from persona p
left join profesor prof on p.id = prof.id_profesor
where p.tipo = 'profesor'
  and prof.id_departamento is null;

-- 3. Retorna una llista de departaments sense professors.
select d.nombre as nombre_departamento
from departamento d
left join profesor prof on d.id = prof.id_departamento
where prof.id_profesor is null;

-- 4. Retorna una llista de professors que no imparteixen cap assignatura.
select p.apellido1,
       p.apellido2,
       p.nombre as nombre_profesor
from persona p
join profesor prof on p.id = prof.id_profesor
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;

-- 5. Retorna una llista d'assignatures sense professor assignat.
select nombre as nombre_asignatura
from asignatura
where id_profesor is null;

-- 6. Retorna una llista de tots els departaments que no imparteixen cap assignatura en cap curs acadèmic.
select distinct d.nombre as nombre_departamento
from departamento d
left join profesor prof on d.id = prof.id_departamento
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;

-- 1. Retorna el nombre total d'alumnes.
select count(*) as total_alumnes
from persona
where tipo = 'alumno';

-- 2. Compta quants alumnes van néixer l'any 1999.
select count(*) as alumnes_nascuts_1999
from persona
where tipo = 'alumno'
  and year(fecha_nacimiento) = 1999;

-- 3. Compta quants professors hi ha a cada departament.
-- Mostra dues columnes: nom departament i nombre de professors.
-- Inclou només departaments amb professors.
-- Ordena per nombre de professors descendent.
select d.nombre as nombre_departamento,
       count(prof.id_profesor) as total_professors
from departamento d
join profesor prof on d.id = prof.id_departamento
group by d.nombre
order by total_professors desc;

-- 4. Retorna una llista amb tots els departaments i el nombre de professors de cada un.
-- Inclou departaments sense professors.
select d.nombre as nombre_departamento,
       count(prof.id_profesor) as total_professors
from departamento d
left join profesor prof on d.id = prof.id_departamento
group by d.nombre
order by total_professors desc;

-- 5. Retorna una llista amb el nom de tots els graus i el nombre d'assignatures de cada un.
-- Inclou graus sense assignatures.
-- Ordena per nombre d'assignatures descendent.
select g.nombre as nombre_grado,
       count(a.id) as total_asignaturas
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
order by total_asignaturas desc;

-- 6. Retorna una llista amb el nom de tots els graus i el nombre d'assignatures de cada un,
-- però només graus amb més de 40 assignatures.
select g.nombre as nombre_grado,
       count(a.id) as total_asignaturas
from grado g
left join asignatura a on g.id = a.id_grado
group by g.nombre
having total_asignaturas > 40
order by total_asignaturas desc;

-- 7. Retorna una llista que mostri el nom del grau, tipus d'assignatura i crèdits totals per tipus.
-- Columnes: nom grau, tipus assignatura, suma crèdits.
select g.nombre as nombre_grado,
       a.tipo as tipo_asignatura,
       sum(a.creditos) as total_creditos
from asignatura a
join grado g on a.id_grado = g.id
group by g.nombre, a.tipo;

-- 8. Retorna una llista que mostri quants alumnes es van matricular en alguna assignatura en cada curs acadèmic.
-- Columnes: any inici i nombre alumnes matriculats.
select ce.anyo_inicio as anyo_inicio,
       count(distinct ama.id_alumno) as total_alumnes
from alumno_se_matricula_asignatura ama
join curso_escolar ce on ama.id_curso_escolar = ce.id
group by ce.anyo_inicio
order by ce.anyo_inicio asc;

-- 9. Retorna una llista amb el nombre d'assignatures impartides per cada professor.
-- Inclou professors que no imparteixen assignatures.
-- Columnes: id, nom, cognoms, nombre assignatures.
-- Ordena per nombre assignatures descendent.
select prof.id_profesor,
       p.nombre,
       p.apellido1,
       p.apellido2,
       count(a.id) as total_asignaturas
from profesor prof
join persona p on prof.id_profesor = p.id
left join asignatura a on prof.id_profesor = a.id_profesor
group by prof.id_profesor, p.nombre, p.apellido1, p.apellido2
order by total_asignaturas desc;

-- 10. Retorna totes les dades de l'alumne més jove.
select *
from persona
where tipo = 'alumno'
order by fecha_nacimiento desc
limit 1;

-- 11. Retorna una llista de professors amb departament assignat però que no imparteixen cap assignatura.
select p.apellido1,
       p.apellido2,
       p.nombre as nombre_profesor,
       d.nombre as nombre_departamento
from persona p
join profesor prof on p.id = prof.id_profesor
join departamento d on prof.id_departamento = d.id
left join asignatura a on prof.id_profesor = a.id_profesor
where a.id is null;