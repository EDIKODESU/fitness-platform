DROP DATABASE IF EXISTS `FitNetDB`;

CREATE DATABASE IF NOT EXISTS `FitNetDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE FitNetDB;

CREATE TABLE IF NOT EXISTS `user` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(45) NOT NULL,
	`firstName` varchar(45) NOT NULL,
	`lastName` varchar(45) NOT NULL,
	`login` varchar(20) NOT NULL,
	`password` varchar(60) NOT NULL,
	`email` varchar(45) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `user_metrics` (
    `user_id` int NOT NULL,
    `body_type` enum('ектоморф','мезоморф','ендоморф'),
    `activity` enum('легка','середня','висока'),
    `sex`enum('жінка','чоловік'),
    `age` int NOT NULL,
    `weight` float NOT NULL,
    `height` float NOT NULL,
    PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `user_diseases` (
	`user_id` int NOT NULL,
	`asthma` boolean,
	`diabetes` boolean,
	`heart` boolean,
	`joints` boolean,
	PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `notes` (
	`id` int NOT NULL AUTO_INCREMENT,
	`note` varchar(90) NOT NULL,
    `user_id` int NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `training_types` (
    `id` int NOT NULL AUTO_INCREMENT,
    `type` enum('збільшення м`язової маси','схуднення','підвищення витривалості','покращення здоров`я та фізичної форми'),
    `description` TEXT,
    `image_link` varchar(120) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `recommended_daily_calorie` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`calories` float NOT NULL,
	`proteins` float NOT NULL,
	`carbohydrates` float NOT NULL,
	`fats` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `user_training_types` (
    `user_id` int NOT NULL,
    `training_type_id` int NOT NULL,
    `recommended_daily_calorie_id` int NOT NULL,
    PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`training_type_id`) REFERENCES `training_types`(`id`),
    FOREIGN KEY (`recommended_daily_calorie_id`) REFERENCES `recommended_daily_calorie`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `diseases` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `description` TEXT,
    `tag` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exercise` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(65) NOT NULL,
    `type` enum('спортзал','дім'),
    `training_day` enum("понеділок", "вівторок", "середа", "четвер", "п’ятниця", "субота", "неділя"),
    `image_link` varchar(120) NOT NULL,
    `number_of_repetitions` float NOT NULL,
    `measurement` enum('хв','раз', 'сет'),
    `number_of_approaches` INT NOT NULL,
    `description` TEXT,
    `muscle_groups_trained` TEXT,
    `training_type_id` int NOT NULL,
    `MET` float NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`training_type_id`) REFERENCES `training_types`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `exercise_diseases` (
    `id` int NOT NULL AUTO_INCREMENT,
    `exercise_id` int NOT NULL,
    `disease_id` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`exercise_id`) REFERENCES `exercise`(`id`),
    FOREIGN KEY (`disease_id`) REFERENCES `diseases`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `nutrition` (
    `id` int NOT NULL AUTO_INCREMENT,
    `training_type_id` int NOT NULL,
    `name` varchar(100) NOT NULL,
    `product_mass` float NOT NULL,
    `measurement` enum('г','мл'),
    `meals_time` enum("сніданок", "обід", "вечеря"),
    `day_nutrition` enum("понеділок", "вівторок", "середа", "четвер", "п’ятниця", "субота", "неділя"),
    `calories` float NOT NULL,
    `proteins` float NOT NULL,
    `fats` float NOT NULL,
    `carbohydrates` float NOT NULL,
	`image_link` varchar(120) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`training_type_id`) REFERENCES `training_types`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `nutrition_diseases` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nutrition_id` int NOT NULL,
    `disease_id` int NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`nutrition_id`) REFERENCES `nutrition`(`id`),
    FOREIGN KEY (`disease_id`) REFERENCES `diseases`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `diabetic_nutrition` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `product_mass` float NOT NULL,
    `measurement` enum('г','мл'),
    `meals_time` enum("сніданок", "обід", "вечеря"),
    `calories` float NOT NULL,
    `proteins` float NOT NULL,
    `fats` float NOT NULL,
    `carbohydrates` float NOT NULL,
    `image_link` varchar(120) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `progress` (
	`id` int NOT NULL AUTO_INCREMENT,
	`BMI` float,
	`BMR` float,
    `weight` float,
    `height` float,
	`user_id` int NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `diseases` (`name`, `description`, `tag`) VALUES
    ('Астма', 'Захворювання, що впливає на дихальні шляхи та може призводити до утрудненого дихання.', 'asthma'),
    ('Діабет', 'Метаболічне захворювання, яке характеризується високим рівнем цукру в крові.', 'diabetes'),
    ('Хвороба серця', 'Захворювання, що впливає на роботу серця та може призводити до різних ускладнень.', 'heart'),
    ('Проблеми з суглобами', 'Захворювання, що впливає на суглоби та може призводити до болю та обмеження руху.', 'joints');

INSERT INTO training_types (`type`, `description`, `image_link`)
VALUES 
    ('збільшення м`язової маси', 'Цей тип тренувань спрямований на збільшення м`язової маси та підвищення сили. Включає вправи з важкими вантажами та великою кількістю повторень.', "/training-type/muscle-mass.png"),
    ('схуднення', 'Цей тип тренувань призначений для зниження зайвої ваги та спалення жирових запасів. Включає кардіо-вправи та вправи на витривалість.', "/training-type/weight-loss.png"),
    ('підвищення витривалості', 'Цей тип тренувань створений для підвищення витривалості та стійкості. Включає вправи з великою кількістю повторень та мінімальним відпочинком між ними.', "/training-type/increase-endurance.png"),
    ('покращення здоров`я та фізичної форми', 'Цей тип тренувань спрямований на загальне покращення здоров`я, збільшення енергії та фізичної форми. Включає різноманітні вправи для всіх м`язових груп та кардіо-навантаження.', "/training-type/improving-health.png");
