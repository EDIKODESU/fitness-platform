USE FitNetDB;

# покращення здоров`я та фізичної форми

# понеділок дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (1, "Мостик", 2.5, "дім", "понеділок", "link_to_image1", 15, "раз", 3, "Ляжте на спину, зігніть коліна, стопи на підлозі, руки по боках; Відштовхуючись ногами, підіймайте стегна вгору, поки можете, стискаючи сідниці. Повільно поверніться на початкову позицію, повторіть.", "ноги, сідниці", 4),
    (2, "Присідання", 4.0, "дім", "понеділок", "link_to_image2", 15, "раз", 3, "Почніть стоячи з ногами на ширині плечей; Сідайте назад, якби сідали на стілець, доки стегна не стануть паралельними підлозі; Повільно поверніться на початкову позицію, повторіть.", "ноги", 4),
    (3, "Віджимання", 4.0, "дім", "понеділок", "link_to_image3", 15, "раз", 3, "Лягаючи на підлогу, підніміть тіло, виштовхуючи себе руками, доки ваші руки повністю не розпрямляться; Повільно поверніться на початкову позицію, повторіть.", "груди, трицепс", 4),
    (4, "Ходьба з випадами", 3.5, "дім", "понеділок", "link_to_image4", 15, "раз", 1, "Робіть крок вперед однією ногою, поки ваша передня нога не утворить кут у 90 градусів; Поверніться в початкову позицію, повторіть з іншою ногою.", "ноги, сідниці", 4),
    (5, "Супермен", 2.5, "дім", "понеділок", "link_to_image5", 10, "раз", 3, "Ляжте на живіт, руки й ноги розставлені; Шия розслаблена, залучаєте корпус та спину, щоб одночасно підняти руки з ноги від підлоги настільки високо, наскільки можете; На вершині зупиніться на секунду, повільно поверніться на початкову позицію, повторіть.", "спина", 4),
    (6, "Планка", 3.0, "дім", "понеділок", "link_to_image6", 1, "хв", 3, "Ляжте на підлогу, підніміть тіло, тримаючися на передпліччях та носі; Тримайте позицію прямої лінії від голови до п'ят, не опускаючи тазу або не піднімаючи спину.", "брюшні, спина", 4),
    (7, "Прес", 4.0, "дім", "понеділок", "link_to_image7", 15, "раз", 3, "Ляжте на спину, зігніть коліна, стопи на підлозі, руки позаду голови; Підніміть корпус, стискаючи черевні м'язи, доки плечі не відійдуть від підлоги; Повільно поверніться на початкову позицію, повторіть.", "брюшні", 4),
    (8, "Скакалка", 7.0, "дім", "понеділок", "link_to_image8", 20, "раз", 3, "Візьміть скакалку в руки, підстрибуйте, обертаючи скакалку навколо себе та намагаючись робити кожен стрибок легким та плавним.", "ноги, руки", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES 
    (6, 3), -- Планка - проблеми з серцем
    (7, 3), -- Прес - проблеми з серцем
    (8, 1), -- Стрибки на скакалці - астма
    (8, 4); -- Стрибки на скакалці - проблеми з суглобами

# понеділок спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (9, "Біг на біговій доріжці", 8.0, "спортзал", "понеділок", "link_to_image1", 5, "хв", 3, "Кардіо-вправа для покращення витривалості та збільшення кількості спалених калорій. Біжіть протягом встановленого часу.", "ноги, серце", 4),
    (10, "Велотренажер", 7.0, "спортзал", "понеділок", "link_to_image2", 6, "хв", 3, "Кардіо-вправа для покращення кровообігу та зміцнення нижніх кінцівок. Педалюйте протягом встановленого часу.", "ноги, серце", 4),
    (11, "Скручування", 4.0, "спортзал", "понеділок", "link_to_image3", 15, "раз", 3, "Вправа для розвитку м'язів живота. Сидячи на тренажері, згинаєтеся вперед і повертаєтеся в початкове положення.", "живіт", 4),
    (12, "Підйом ніг", 5.5, "спортзал", "понеділок", "link_to_image4", 12, "раз", 3, "Вправа для розвитку м'язів ніг. Сидячи на тренажері, піднімаєте ноги вгору та вниз. Додавайте вагу на тренажер з кожним підходом.", "ноги", 4),
    (13, "Еліптичний тренажер", 6.0, "спортзал", "понеділок", "link_to_image5", 5, "хв", 2, "Кардіо-вправа для покращення кровообігу та збільшення витривалості. Вправа на еліптичному тренажері протягом встановленого часу.", "ноги, серце", 4),
    (14, "Тяга рук", 5.5, "спортзал", "понеділок", "link_to_image6", 6, "раз", 3, "Вправа для розвитку м'язів рук. Сядьте на тренажер так, щоб рукоятки тренажера були прямо над вашими плечима, візьміть рукоятку хватом ширше плечей, втягніть живіт і напружте прес, злегка відхилившись назад і першим рухом зведіть лопатки разом, опустіть їх донизу і плавно почніть тягнути вниз лікті. Додавайте вагу на тренажер з кожним підходом.", "руки, спина", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES 
	(9, 3), -- Біг на біговій доріжці - проблеми з серцем
    (10, 1), -- Велотренажер - астма
    (10, 4), -- Велотренажер - проблеми з суглобами
    (11, 3), -- Скручування - проблеми з серцем
    (12, 4), -- Підйом ніг - проблеми з суглобами
    (13, 1), -- Еліптичний тренажер - астма
    (13, 4), -- Еліптичний тренажер - проблеми з суглобами
    (14, 4); -- Тяга рук - проблеми з суглобами

# вівторок дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (15, "Присідання", 4.0, "дім", "вівторок", "link_to_image2", 15, "раз", 3, "Почніть стоячи з ногами на ширині плечей; Сідайте назад, якби сідали на стілець, доки стегна не стануть паралельними підлозі; Повільно поверніться на початкову позицію, повторіть.", "ноги", 4),
    (16, "Мертвий жучок", 2.5, "дім", "вівторок", "link_to_image2", 10, "раз", 3, "Лежачи на спині, ноги зігнуті в колінах під прямим кутом; Скоординованими рухами випрямляйте ліву ногу, а праву руку заводьте за голову; стежте, щоб низ спини був статичним на підлозі; Поверніться в початкову позицію, повторіть на інший бік.", "прес", 4),
    (17, "Стрибки на місці", 6.5, "дім", "вівторок", "link_to_image3", 10, "раз", 3, "Кардіо-вправа для підвищення витривалості та розвитку координації рухів. Виконуйте стрибки на місці протягом встановленого часу.", "Ноги, серце", 4),
    (18, "Скакалка", 7.0, "дім", "вівторок", "link_to_image8", 20, "раз", 3, "Кардіо-вправа зі скакалкою для підвищення витривалості та спалення калорій. Візьміть скакалку в руки, підстрибуйте, обертаючи скакалку навколо себе та намагаючись робити кожен стрибок легким та плавним.", "ноги, руки", 4),
    (19, "Коліно-лікоть", 3.0, "дім", "вівторок", "link_to_image3", 10, "раз", 3, "Кардіо-вправа для підвищення витривалості та розвитку координації рухів. Зігніть ногу в коліні, підніміть коліно і торкніться його ліктем протилежної руки, чередуйте боки.", "Ноги, серце", 4),
    (20, "Стрибки від лавки", 8.0, "дім", "вівторок", "link_to_image6", 3, "хв", 3, "Кардіо-вправа для підвищення витривалості та розвитку м'язової сили. Виконуйте стрибки від лавки протягом встановленого часу.", "Ноги, серце", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES 
    (17, 1), -- Стрибки на місці - астма
    (17, 4), -- Стрибки на місці - проблеми з суглобами
	(18, 1), -- Стрибки від лавки - астма
    (18, 4), -- Стрибки від лавки - проблеми з суглобами
    (20, 1), -- Стрибки від лавки - астма
    (20, 4); -- Стрибки від лавки - проблеми з суглобами

# середа дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (21, "Розтяжка стоячи", 3.0, "дім", "середа", "new_link_to_image7", 1, "хв", 3, "Станьте на рівній поверхні, поставте ноги на ширину плечей, підніміть руки вгору і витягніться вгору, спрямовуючи дихання в боки.", "Ноги", 4),
    (22, "Розтяжка рук в стоячому положенні", 3.0, "дім", "середа", "new_link_to_image8", 1, "хв", 3, "Встаньте прямо, піднявши руки вгору, злегка наклоніться вліво або вправо, почуваючи розтяжку по боках тіла.", "Руки, плечі", 4),
    (23, "Розтяжка спини", 3.0, "дім", "середа", "new_link_to_image9", 1, "хв", 3, "Ляжте на плоску поверхню, підніміть руки вгору, злегка підніміть корпус вгору, почуваючи розтяжку в спині.", "Спина", 4),
    (24, "Віджимання", 4.0, "дім", "середа", "new_link_to_image10", 10, "раз", 3, "Ляжте на підлогу, розмістіть руки на плечах, опустіть тіло до того часу, поки ваші лікті не стануть вигнутими під кутом 90 градусів, а потім підніміться назад.", "Груди, плечі, трицепс", 4),
    (25, "Планка", 3.0, "дім", "середа", "new_link_to_image11", "1", "хв", 3, "Прийміть положення лежачи на передпліччях, ставши на носки та розмістіть тіло в прямій лінії від голови до п'ят.", "Коріння", 4),
    (26, "Віджимання на ковзаних дверях", 4.0, "дім", "середа", "new_link_to_image12", 15, "раз", 3, "Поставте долоні на стійку дверей, зробіть крок назад, опустіть тіло, зігніть лікті, потім піднятися.", "Груди, плечі, трицепс", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES 
  (25, 3), -- Планка - проблеми з серцем
  (26, 4); -- Віджимання на ковзаних дверях - проблеми з суглобами
  
# середа спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (27, "Біг на біговій доріжці", 8.0, "спортзал", "середа", "link_to_image1", 5, "хв", 3, "Кардіо-вправа для покращення витривалості та збільшення кількості спалених калорій. Біжіть протягом встановленого часу.", "ноги, серце", 4),
    (28, "Жим гантель від плечей стоячи", 5.5, "спортзал", "середа", "link_to_image2", 5, "раз", 3, "Тренування для зміцнення м'язів рук та плечей з використанням гантелей. Встаньте прямо та тримайте спину рівно. Міцно утримуючи гантелі, витисніть їх над головою, повністю випрямивши руки. Зробіть паузу і потім повільно опустіть у вихідне положення. Додавайте вагу на тренажер з кожним підходом.", "Руки, плечі", 4),
    (29, "Еліптичний тренажер", 6.0, "спортзал", "середа", "link_to_image5", 5, "хв", 2, "Кардіо-вправа для покращення кровообігу та збільшення витривалості. Вправа на еліптичному тренажері протягом встановленого часу.", "ноги, серце", 4),
    (30, "Скручування", 4.0, "спортзал", "середа", "link_to_image3", 15, "раз", 3, "Вправа для розвитку м'язів живота. Сидячи на тренажері, згинаєтеся вперед і повертаєтеся в початкове положення.", "живіт", 4),
    (31, "Тяга рук", 5.5, "спортзал", "середа", "link_to_image6", 6, "раз", 3, "Вправа для розвитку м'язів рук. Сядьте на тренажер так, щоб рукоятки тренажера були прямо над вашими плечима, візьміть рукоятку хватом ширше плечей, втягніть живіт і напружте прес, злегка відхилившись назад і першим рухом зведіть лопатки разом, опустіть їх донизу і плавно почніть тягнути вниз лікті. Додавайте вагу на тренажер з кожним підходом.", "руки, спина", 4),
    (32, "Велотренажер", 7.0, "спортзал", "середа", "link_to_image2", 6, "хв", 3, "Кардіо-вправа для покращення кровообігу та зміцнення нижніх кінцівок. Педалюйте протягом встановленого часу.", "ноги, серце", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES 
  (28, 4), -- Вправи з гантелями - проблеми з суглобами
  (30, 3), -- Скручування - проблеми з серцем
  (31, 4), -- Тяга рук - проблеми з суглобами
  (32, 1), -- Велотренажер - астма
  (32, 4); -- Велотренажер - проблеми з суглобами

# п’ятниця дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (33, "Прес", 4.0, "дім", "п’ятниця", "link_to_image7", 15, "раз", 3, "Ляжте на спину, зігніть коліна, стопи на підлозі, руки позаду голови; Підніміть корпус, стискаючи черевні м'язи, доки плечі не відійдуть від підлоги; Повільно поверніться на початкову позицію, повторіть.", "брюшні", 4),
    (34, "Прес-папуга", 4.5, "дім", "п’ятниця", "link_to_image2", 12, "раз", 3, "Вправа для розвитку м'язів живота та зміцнення корпусу. Ляжте на підлогу, руки за головою. Підніміть тулуб та ноги, намагаючись доторкнутися ногами до рук.", "м'язи живота, корпус", 4),
    (35, "Скелолаз", 6.5, "дім", "п’ятниця", "link_to_image3", 1, "хв", 2, "Кардіо-вправа для підвищення витривалості та спалення калорій. Займіть положення планки на витягнутих руках, рівномірно розподіливши вагу між руками та пальцями ніг. Підтягніть праве коліно до грудей. Не послаблюючи контролю над мускулатурою корпусу, поверніть праву ногу назад і підтягніть до грудей ліву ногу.", "живіт, стегна, сідниці", 4),
    (36, "Присідання", 4.0, "дім", "п’ятниця", "link_to_image2", 15, "раз", 3, "Почніть стоячи з ногами на ширині плечей; Сідайте назад, якби сідали на стілець, доки стегна не стануть паралельними підлозі; Повільно поверніться на початкову позицію, повторіть.", "ноги", 4),
    (37, "Підйом ніг у висі", 4.0, "дім", "п’ятниця", "link_to_image5", 8, "раз", 3, "Вправа для розвитку м'язів преса та нижньої частини живота. Висіть на перекладині з рукою на ширині плечей. Піднімайте ноги вгору з зогнутими колінами, а потім повільно опускайте їх.", "прес, нижня частина живота", 4),
    (38, "Скакалка", 7.0, "дім", "п’ятниця", "link_to_image8", 20, "раз", 3, "Кардіо-вправа зі скакалкою для підвищення витривалості та спалення калорій. Візьміть скакалку в руки, підстрибуйте, обертаючи скакалку навколо себе та намагаючись робити кожен стрибок легким та плавним.", "ноги, руки", 4);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
  (33, 3), -- Прес - проблеми з серцем
  (34, 3), -- Прес-папуга - проблеми з серцем
  (37, 4), -- Підйом ніг у висі - проблеми з суглобами
  (38, 1), -- Скакалка - астма
  (38, 4); -- Скакалка - проблеми з суглобами
  
# п’ятниця спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (39, "Біг на біговій доріжці", 8.0, "спортзал", "п’ятниця", "link_to_image1", 5, "хв", 3, "Кардіо-вправа для покращення витривалості та збільшення кількості спалених калорій. Біжіть протягом встановленого часу.", "ноги, серце", 4),
    (40, "Велотренажер", 7.0, "спортзал", "п’ятниця", "link_to_image2", 6, "хв", 3, "Кардіо-вправа для покращення кровообігу та зміцнення нижніх кінцівок. Педалюйте протягом встановленого часу.", "ноги, серце", 4),
    (41, "Скручування", 4.0, "спортзал", "п’ятниця", "link_to_image3", 15, "раз", 3, "Вправа для розвитку м'язів живота. Сидячи на тренажері, згинаєтеся вперед і повертаєтеся в початкове положення.", "живіт", 4),
    (42, "Тяга рук", 5.5, "спортзал", "п’ятниця", "link_to_image6", 6, "раз", 3, "Вправа для розвитку м'язів рук. Сядьте на тренажер так, щоб рукоятки тренажера були прямо над вашими плечима, візьміть рукоятку хватом ширше плечей, втягніть живіт і напружте прес, злегка відхилившись назад і першим рухом зведіть лопатки разом, опустіть їх донизу і плавно почніть тягнути вниз лікті. Додавайте вагу на тренажер з кожним підходом.", "руки, спина", 4),
    (43, "Підйом на лаву з гантелями", 5.5, "спортзал", "п’ятниця", "link_to_image6", 6, "раз", 3, "Стати прямо, тримаючи в обох руках по гантелі. Підніміть праву ногу на платформу. Натискаючи на п’яту, підніміться і повністю випряміть коліно. Підніміть слідом ліву ногу. Руки з гантелями при цьому залишаються випрямленими та розташованими з боків. Зігніть праве коліно та зробіть крок назад лівою, а потім правою ногою.", "квадрицепс, сідниці, задня поверхня стегна", 4);
    
INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
	(39, 3), -- Біг на біговій доріжці - проблеми з серцем
    (40, 1), -- Велотренажер - астма
    (40, 4), -- Велотренажер - проблеми з суглобами
    (41, 3), -- Скручування - проблеми з серцем
    (42, 4), -- Тяга рук - проблеми з суглобами  
	(43, 4); -- Підйом на лаву з гантелями - проблеми з суглобами  
