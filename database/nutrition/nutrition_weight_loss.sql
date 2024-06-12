USE FitNetDB;

# схуднення

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(56, 2, 'Вівсяна каша', 100, 'г', 'сніданок', 'понеділок', 88, 3, 0, 17, 'link_to_image'),
(57, 2, 'Яблуко зелене', 100, 'г', 'сніданок', 'понеділок', 42, 0.96, 0.46, 9.42, 'link_to_image'),
(58, 2, 'Зелений чай без цукру', 250, 'мл', 'сніданок', 'понеділок', 1, 0, 0, 0.25, 'link_to_image'),
(59, 2, 'Філе куряче тушковане', 100, 'г', 'обід', 'понеділок', 151, 29, 3, 0, 'link_to_image'),
(60, 2, 'Картопляне пюре', 100, 'г', 'обід', 'понеділок', 115, 2.7, 2.75, 19.47, 'link_to_image'),
(61, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'понеділок', 1, 0, 0, 0.25, 'link_to_image'),
(62, 2, 'Хек запечений з овочами', 100, 'г', 'вечеря', 'понеділок', 96, 9.45, 4.84, 3.93, 'link_to_image'),
(63, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'понеділок', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (60, 2); -- діабет

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(64, 2, 'Омлет з овочами', 100, 'г', 'сніданок', 'вівторок', 136, 8.5, 8.6, 2.5, 'link_to_image'),
(65, 2, 'Зелений чай без цукру', 250, 'мл', 'сніданок', 'вівторок', 1, 0, 0, 0.25, 'link_to_image'),
(66, 2, 'Рис з овочами', 100, 'г', 'обід', 'вівторок', 136, 1.6, 3.8, 15.1, 'link_to_image'),
(67, 2, 'Філе куряче тушковане', 100, 'г', 'обід', 'вівторок', 151, 29, 3, 0, 'link_to_image'),
(68, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'вівторок', 1, 0, 0, 0.25, 'link_to_image'),
(69, 2, 'Гречка', 100, 'г', 'вечеря', 'вівторок', 105, 3.38, 0.62, 19.94, 'link_to_image'),
(70, 2, 'Котлета куряча парова', 100, 'г', 'вечеря', 'вівторок', 135, 21.5, 2, 4, 'link_to_image'),
(71, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'вівторок', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (66, 2); -- діабет

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(72, 2, 'Запіканка сирна', 100, 'г', 'сніданок', 'середа', 176, 17.6, 4.2, 14.6, 'link_to_image'),
(73, 2, 'Зелений чай без цукру', 250, 'мл', 'сніданок', 'середа', 1, 0, 0, 0.25, 'link_to_image'),
(74, 2, 'Салат з морською капустою і яйцем', 100, 'г', 'обід', 'середа', 166, 10, 11, 6, 'link_to_image'),
(75, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'середа', 1, 0, 0, 0.25, 'link_to_image'),
(76, 2, 'Котлета куряча парова', 100, 'г', 'вечеря', 'середа', 135, 21.5, 2, 4, 'link_to_image'),
(77, 2, 'Салат з помідорами і сиром фета', 100, 'г', 'вечеря', 'середа', 105, 4.1, 8.3, 3.5, 'link_to_image'),
(78, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'середа', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (72, 2); -- діабет

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(79, 2, 'Мюслі з йогуртом', 100, 'г', 'сніданок', 'четвер', 221, 6.96, 6.5, 25.7, 'link_to_image'),
(80, 2, 'Банан', 100, 'г', 'сніданок', 'четвер', 94, 1.2, 0.2, 22, 'link_to_image'),
(81, 2, 'Вода з лимоном', 250, 'мл', 'сніданок', 'четвер', 4, 0, 0, 1, 'link_to_image'),
(82, 2, 'Гречка', 100, 'г', 'обід', 'четвер', 105, 3.38, 0.62, 19.94, 'link_to_image'),
(83, 2, 'Філе куряче тушковане', 100, 'г', 'обід', 'четвер', 151, 29, 3, 0, 'link_to_image'),
(84, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'четвер', 1, 0, 0, 0.25, 'link_to_image'),
(85, 2, 'Яєчний білок', 100, 'г', 'вечеря', 'четвер', 50, 11, 0.2, 0.8, 'link_to_image'),
(86, 2, 'Салат з огірків помідорів і сметаною', 100, 'г', 'вечеря', 'четвер', 50, 1, 3, 3, 'link_to_image'),
(87, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'четвер', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (79, 2); -- діабет

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(88, 2, 'Сендвіч з куркою, помідорами та огірками', 100, 'г', 'сніданок', 'п’ятниця', 134, 9.62, 3.82, 14.62, 'link_to_image'),
(89, 2, 'Зелений чай без цукру', 250, 'мл', 'сніданок', 'п’ятниця', 1, 0, 0, 0.25, 'link_to_image'),
(90, 2, 'Каша пшенична', 100, 'г', 'обід', 'п’ятниця', 105, 3.8, 0.4, 20.7, 'link_to_image'),
(91, 2, 'М’ясо куряче варене', 100, 'г', 'обід', 'п’ятниця', 204, 18, 18, 1, 'link_to_image'),
(92, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'п’ятниця', 1, 0, 0, 0.25, 'link_to_image'),
(93, 2, 'Сочевичний суп з овочами', 100, 'г', 'вечеря', 'п’ятниця', 59, 2.8, 2, 7.4, 'link_to_image'),
(94, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'п’ятниця', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(95, 2, 'Рис з овочами', 100, 'г', 'сніданок', 'субота', 99, 1.6, 3.8, 15.1, 'link_to_image'),
(96, 2, 'Вода з лимоном', 250, 'мл', 'сніданок', 'субота', 4, 0, 0, 1, 'link_to_image'),
(97, 2, 'Риба тушкована в томаті з овочами', 100, 'г', 'обід', 'субота', 110, 14, 3.96, 7.1, 'link_to_image'),
(98, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'субота', 1, 0, 0, 0.25, 'link_to_image'),
(99, 2, 'Картопляне пюре', 100, 'г', 'вечеря', 'субота', 115, 2.7, 2.75, 19.47, 'link_to_image'),
(100, 2, 'Котлети курячі рублені', 100, 'г', 'вечеря', 'субота', 125, 18.72, 3.85, 3.35, 'link_to_image'),
(101, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'субота', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (95, 2); -- діабет

INSERT INTO `nutrition` (`id`, `training_type_id`, `name`, `product_mass`, `measurement`, `meals_time`, `day_nutrition`, `calories`, `proteins`, `fats`, `carbohydrates`, `image_link`) VALUES
(102, 2, 'Млинці з медом', 100, 'г', 'сніданок', 'неділя', 210, 4.3, 2.5, 42.2, 'link_to_image'),
(103, 2, 'Зелений чай без цукру', 250, 'мл', 'сніданок', 'неділя', 1, 0, 0, 0.25, 'link_to_image'),
(104, 2, 'Рагу овочеве з куркою', 100, 'г', 'обід', 'неділя', 85, 7, 4, 5, 'link_to_image'),
(105, 2, 'Зелений чай без цукру', 250, 'мл', 'обід', 'неділя', 1, 0, 0, 0.25, 'link_to_image'),
(106, 2, 'Запечена риба', 100, 'г', 'вечеря', 'неділя', 103, 6.8, 4.7, 8.4, 'link_to_image'),
(107, 2, 'Запечені овочі', 100, 'г', 'вечеря', 'неділя', 33, 1.17, 1.1, 5, 'link_to_image'),
(108, 2, 'Зелений чай без цукру', 250, 'мл', 'вечеря', 'неділя', 1, 0, 0, 0.25, 'link_to_image');

INSERT INTO `nutrition_diseases` (`nutrition_id`, `disease_id`)
VALUES 
    (102, 2); -- діабет