# Proyecto SQL — Bases de Datos Tienda & Universidad

## Goal

This repository contains SQL queries for two separate MySQL databases:

- `tienda`: focused on products and manufacturers.
- `universidad`: focused on academic data — students, professors, subjects, and departments.

---

## File Structure

```
./
├── consultas_tienda.sql
├── consultas_universidad.sql
├── README.md
```

- `schema_tienda.sql`: Creates tables `producto` and `fabricante` with real sample data.
- `schema_universidad.sql`: Creates tables `persona`, `profesor`, `departamento`, `grado`, `asignatura`, `curso_escolar` and `alumno_se_matricula_asignatura`.
- `consultas_tienda.sql`: Contains queries to explore products (`producto`) and manufacturers (`fabricante`).
- `consultas_universidad.sql`: Contains queries to analyze students (`persona`), professors (`profesor`), subjects (`asignatura`) and departments (`departamento`).

---

## Tables — Tienda

### `fabricante`

- `codigo`: INT, primary key.
- `nombre`: VARCHAR, manufacturer’s name.

### `producto`

- `codigo`: INT, primary key.
- `nombre`: VARCHAR, product name.
- `precio`: DOUBLE, product price.
- `codigo_fabricante`: INT, foreign key referencing `fabricante(codigo)`.

Example data: Asus, Lenovo, Hewlett-Packard, Seagate, Crucial, etc.

---

## Tables — Universidad

### `persona`

- `id`: INT, primary key.
- `nif`: Unique ID.
- `nombre`, `apellido1`, `apellido2`: Names.
- `telefono`, `fecha_nacimiento`, `tipo`: Contact and type (`profesor` or `alumno`).

### `profesor`

- `id_profesor`: INT, PK, FK to `persona`.
- `id_departamento`: INT, FK to `departamento`.

### `departamento`

- `id`: INT, PK.
- `nombre`: Department name.

### `grado`

- `id`: INT, PK.
- `nombre`: Degree name.

### `asignatura`

- `id`: INT, PK.
- `nombre`: Subject name.
- `creditos`: FLOAT.
- `tipo`: Enum (`básica`, `obligatoria`, `optativa`).
- `curso`, `cuatrimestre`: Course and semester.
- `id_profesor`: FK to `profesor`.
- `id_grado`: FK to `grado`.

### `curso_escolar`

- `id`: INT, PK.
- `anyo_inicio`, `anyo_fin`: Academic year.

### `alumno_se_matricula_asignatura`

- `id_alumno`: FK to `persona`.
- `id_asignatura`: FK to `asignatura`.
- `id_curso_escolar`: FK to `curso_escolar`.

---

## How to Run

Create the databases:

```bash
mysql -u [user] -p < schema_tienda.sql
mysql -u [user] -p < schema_universidad.sql
```

Run the queries:

```bash
mysql -u [user] -p tienda < consultas_tienda.sql
mysql -u [user] -p universidad < consultas_universidad.sql
```

Verify results and adjust queries only if the schema stays unchanged.
