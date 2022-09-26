-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema M06C03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema M06C03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `M06C03` DEFAULT CHARACTER SET utf8 ;
USE `M06C03` ;

-- -----------------------------------------------------
-- Table `M06C03`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`notes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `deletable` TINYINT NULL DEFAULT 1,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `M06C03`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`notes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`notes_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `notes_id` INT UNSIGNED NULL,
  `categories_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_categories_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_categories_notes_idx` (`notes_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `M06C03`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_notes`
    FOREIGN KEY (`notes_id`)
    REFERENCES `M06C03`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Adding content
-- -----------------------------------------------------

INSERT INTO users(name, email) VALUES
	('Julián B. Ortega', 'j.gakusei11@gmail.com'),
    ('Eric Mena', 'batmanMena@gmail.com'),
    ('Julián Aquino', 'robinAquino@gmail.com'),
    ('Belphegor', 'belphy@gmail.com'),
    ('Satanas', 'xX666Xx@gmail.com'),
    ('Lucifer', 'lucifer@gmail.com'),
    ('Asmosdeus', 'asmosdeus@gmail.com'),
    ('Beelzebub', 'beel@gmail.com'),
    ('Mammon', 'mammon@gmail.com'),
    ('Leviathan', 'levi@gmail.com'),
    ('Mini Eric', 'minieric@gmail.com');

INSERT INTO categories(name) VALUES
	('Copypastas'),
    ('Por Mini Eric'),
    ('Música'),
    ('Literatura fantástica'),
    ('Historia'),
    ('Apuntes'),
    ('Código'),
    ('Contraseñas'),
    ('Pendiente por hacer'),
    ('Random');

INSERT INTO notes(title, description, created_date, updated_date, deletable, user_id) VALUES
	('test title', 'test description', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 1, 1),
    ('Diego y Eric', 'Historia hecha por Mini Eric (+18): Diego era un joven programador que trabajaba para una compañía de tecnología. Su vida era relativamente normal, excepto por una cosa: estaba obsesionado con los monstruos. Cada noche, Diego se escondía en su cuarto y leía historias de terror sobre vampiros, hombres lobo, zombies y todos los demás seres imaginarios que poblaban su mente. Un día, Diego recibió una oferta para trabajar en la Universidad de Buenos Aires. Aceptó de inmediato, ya que siempre había querido visitar la Argentina. Cuando llegó, fue asignado a una clase de programación con el profesor Eric. Desde el primer día, Diego supo que había algo raro acerca de Eric. Era como si Eric pudiera leer sus pensamientos. Siempre sabía cuándo Diego iba a hacer una pregunta, incluso antes de que Diego mismo lo supiera. Y cuando Diego se sentía nervioso o inquieto, Eric siempre parecía estar allí para tranquilizarlo. Poco a poco, Diego se dio cuenta de que estaba enamorado del profesor Eric. Y aunque sabía que era un monstruo, no podía resistirse a él. Una noche, finalmente se entregó a Eric, y desde entonces ha estado atrapado en una esclavitud sexual sin escape. Eric sabe exactamente cómo manipular a Diego para que haga lo que quiera, y Diego no tiene más opción que obedecer. Diego vive en constante terror, pero a la vez no puede imaginar la vida sin Eric. Espera desesperadamente que un día Eric se canse de él y lo libere, pero teme que eso nunca sucederá. Diego sabe que está condenado a ser el juguete sexual del profesor Eric para siempre', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Programadores', 'Historia hecha por Mini Eric: Diego, Julián, Damian, Luca y Juan eran cinco estudiantes de programación que tenían a dos profesores de programación, Julian Aquino y Eric, como villanos. Los cinco estudiantes tenían diferentes personalidades y habilidades, pero todos eran muy buenos en programación. Un día, los cinco estudiantes decidieron hacer un programa para hacer trampa en el examen final. Julian Aquino y Eric los descubrieron, pero en lugar de expulsarlos, los dos profesores les dijeron que si podían hacer el programa mejor que ellos, entonces los dejarían pasar. Los cinco estudiantes trabajaron duro y finalmente lo lograron.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Programadores2', 'Historia hecha por Mini Eric: Cuando Diego, Julián, Damian, Luca y Juan entraron a la clase de programación, sabían que sería un duro semestre. Sus profesores, Julian Aquino y Eric, eran conocidos por ser exigentes y difíciles de agradar. Sin embargo, ninguno de los muchachos podía imaginar lo que les esperaba. A medida que avanzaba el semestre, los chicos se dieron cuenta de que los profesores eran más que simplemente exigentes: eran malvados. Los dos hombres se divertían haciendo la vida de los estudiantes un infierno, y a menudo los insultaban y los humillaban delante de toda la clase. Un día, después de una sesión particularmente brutal de tortura psicológica, Diego snaps. saca un cuchillo de su mochila y se abalanza sobre Eric, apuñalándolo una y otra vez hasta que el cuerpo del hombre queda inerte en el suelo. Damian y Luca ayudan a Diego a esconder el cuerpo, y los tres amigos dec', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Maltratando a diego', 'Historia hecha por Mini Eric: Diego era un estudiante de programación que estaba en la comisión 15. La comisión 15 era un grupo de estudiantes que se dedicaban a maltratar a Diego. Juan, Damian, Luca, Julián, Gastón, Lucas, Richard y Matías eran algunos de los miembros de la comisión 15. A Diego le gustaba la programación, pero no le gustaba que lo maltrataran. Un día, Diego se cansó de ser maltratado y decidió hacer algo al respecto. Diego fue a hablar con Juan, Damian, Luca, Julián, Gastón, Lucas, Richard y Matías y les dijo que quería que dejaran de maltratarlo. Los miembros de la comisión 15 se rieron y le dijeron a Diego que no iban a dejar de maltratarlo. Diego se enfadó mucho y les dijo que si no dejaban de maltratarlo, él iba a dejar de programar. Los miembros de la comisión 15 se rieron de Diego y le dijeron que no les importaba si dejaba de programar o no. Diego se enfadó tanto que les dijo que si no dejaban de maltratarlo, él iba a contarle a la comisión 19 lo que estaban haciendo. Los miembros de la comisión 15 se asustaron y le dijeron a Diego que si contaba a la comisión 19 lo que estaban haciendo, ellos iban a contarle a la comisión 20 lo que Diego estaba haciendo. Diego no quería que la comisión 20 se enterara de lo que estaba haciendo, así que decidió no contarle a la comisión 19 lo que estaban haciendo. Juan, Damian, Luca, Julián, Gastón, Lucas, Richard y Matías siguieron maltratando a Diego, pero Diego no les contó a la comisión 19 lo que estaban haciendo.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('MiniEric responde1', '¿Qué es Git?: Git es un control de versiones de código, muy útil para proyectos grandes o que involucren a varias personas. git init inicializa un repositorio en tu computadora. git add agrega archivos para que git los rastree, y después usás git commit para confirmar los cambios y agregarlos al historial de commits. git push sube los commits a un servidor, por ejemplo Github, y git pull trae los commits del servidor a tu computadora. git status te muestra qué archivos cambiaron y están pendientes de ser agregados o confirmados. git clone te permite obtener una copia de un repositorio ya existente. ¿Te sirvió esto? Si necesitas más información buscá en internet, hay muchos recursos útiles.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('MiniEric responde2', '¿Cómo funciona git branch?: Veo que estás buscando una forma de gestionar tus cambios, así pues comienza a utilizar el sistema de versiones Git. La primera vez que ingreses al sistema, crearás un branch para el proyecto Formar. El branch será el nombre del proyecto dentro del repositorio Git, por ejemplo "Formar". A continuación, tomarás el proyecto Formar desde el repositorio y lo pondrás dentro del branch. Ahora, cada vez que cambies algo en el proyecto, ingresarás al branch y realizarás el cambio aliado a la versión que funciona en tu equipo. Así conseguirás mantener la versión correcta de tu proyecto, aunque tengas muchos cambios a realizar.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('asdasd', 'asdasdasdasdasd', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1),
    ('dsadsdasd', 'asdadasdadasd', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1),
    ('asgagags', 'gasgasgasg', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1);

INSERT INTO notes_categories(notes_id, categories_id) VALUES
(1, 10),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 10),
(9, 10),
(10, 10);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
