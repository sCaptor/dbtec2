CREATE DATABASE tecnica2db;
CREATE USER ‘admin’@’localhost’ IDENTIFIED BY ‘contraseña’;
GRANT ALL PRIVILEGES ON tecnica2db.* to ‘admin’@’localhost’;

CREATE TABLE roles (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50)
);

CREATE TABLE tareas (
id INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(100)
);

CREATE TABLE usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
id_rol INT,
nombre VARCHAR(50),
contrasena VARCHAR(255),
fecha_ultimo_cambio DATE,
fecha_vencimiento DATE,
FOREIGN KEY (id_rol) REFERENCES roles(id)
);

CREATE TABLE bitacora (
id INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT,
id_tarea INT,
descripcion VARCHAR(100),
fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
FOREIGN KEY (id_tarea) REFERENCES tareas(id)
); 

CREATE TABLE docente (
id INT PRIMARY KEY AUTO_INCREMENT,
dni VARCHAR(8),
nombre VARCHAR(50),
apellido VARCHAR(50)
);


CREATE TABLE cursos (
id INT PRIMARY KEY AUTO_INCREMENT,
cod_curso VARCHAR(10),
nombre_curso VARCHAR(10),
id_docente INT,
FOREIGN KEY (id_docente) REFERENCES docente(id)
);

CREATE TABLE alumno (
id INT PRIMARY KEY AUTO_INCREMENT,
dni VARCHAR(8),
legajo INT,
nombre VARCHAR(50),
apellido VARCHAR(50),
fec_nac DATE,
fec_ingreso DATE,
curso INT,
carrera VARCHAR(30),
FOREIGN KEY (curso) REFERENCES cursos(id)
);

CREATE TABLE responsable (
id INT PRIMARY KEY AUTO_INCREMENT,
dni VARCHAR(8),
id_alumno INT,
nombre VARCHAR(50),
apellido VARCHAR(50),
FOREIGN KEY (id_alumno) REFERENCES alumno(id)
);


-- UPDATE usuarios SET contrasena = 'nuevo_hash_de_contrasena',
--     fecha_ultimo_cambio = CURDATE(),
--     fecha_vencimiento = DATE_ADD(CURDATE(), INTERVAL 90 DAY)
-- WHERE id = 1;
