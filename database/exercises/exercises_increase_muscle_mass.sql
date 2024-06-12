USE FitNetDB;

# збільшення м`язової маси

# понеділок дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (115, "Віджимання", 3.8, "дім", "понеділок", "link_to_image1", 15, 'раз', 4, "Ляжте обличчям вниз, руки на ширині плечей. Віджимайтеся, поки руки не випростаються, тримайте тіло прямим.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (116, "Присідання", 5.0, "дім", "понеділок", "link_to_image1", 12, 'раз', 3, "Станьте прямо, ноги на ширині плечей. Присідайте, поки стегна не будуть паралельні підлозі.", "квадрицепси, сідничні м’язи, задня частина стегон", 1),
    (117, "Планка", 2.5, "дім", "понеділок", "link_to_image1", 1, 'хв', 3, "Ляжте обличчям вниз, спираючись на передпліччя та носки. Тримайте тіло прямим, напружуючи м’язи живота.", "прес, спина, плечі", 1),
    (118, "Віджимання від стіни", 3.5, "дім", "понеділок", "link_to_image1", 15, 'раз', 4, "Станьте обличчям до стіни, руки на ширині плечей на стіні. Віджимайтеся, згинаючи лікті.", "грудні м’язи, трицепси", 1),
    (119, "Підйоми ніг", 3.0, "дім", "понеділок", "link_to_image1", 15, 'раз', 3, "Ляжте на спину, руки вздовж тіла. Піднімайте прямі ноги вгору, потім повільно опускайте.", "прес, стегна", 1),
    (120, "Бічна планка", 2.5, "дім", "понеділок", "link_to_image1", 1, 'хв', 4, "Ляжте на бік, спираючись на одне передпліччя та стопу. Тримайте тіло прямим, напружуючи бічні м’язи живота.", "бічні м’язи живота, спина", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (115, 3), -- Віджимання - проблеми з серцем
    (116, 4), -- Присідання - проблеми з суглобами
    (117, 1), -- Планка - проблеми з дихальною системою
    (118, 3), -- Віджимання від стіни - проблеми з серцем
    (119, 4); -- Підйоми ніг - проблеми з суглобами

# понеділок спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (121, "Станова тяга", 6.0, "спортзал", "понеділок", "link_to_image1", 8, 'раз', 4, "Станьте прямо, ноги на ширині плечей. Нахиліться і візьміть штангу, тримайте спину прямою. Підніміть штангу до стегон, потім опустіть. Додавайте вагу на тренажер з кожним підходом.", "спина, стегна, сідничні м’язи", 1),
    (122, "Жим штанги лежачи", 6.0, "спортзал", "понеділок", "link_to_image1", 8, 'раз', 4, "Ляжте на лавку, ноги на підлозі. Візьміть штангу широким хватом і опустіть до грудей, потім віджимайте вгору. Додавайте вагу на тренажер з кожним підходом.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (123, "Присідання зі штангою", 6.0, "спортзал", "понеділок", "link_to_image1", 8, 'раз', 4, "Станьте прямо, штанга на плечах. Присідайте, поки стегна не будуть паралельні підлозі, потім піднімайтеся. Додавайте вагу на тренажер з кожним підходом.", "квадрицепси, сідничні м’язи, задня частина стегон", 1),
    (124, "Підтягування", 5.0, "спортзал", "понеділок", "link_to_image1", 10, 'раз', 4, "Візьміться за перекладину широким хватом. Підтягуйтеся, поки підборіддя не буде над перекладиною, потім опускайтеся.", "широчезні м’язи спини, біцепси, передпліччя", 1),
    (125, "Жим штанги стоячи (військовий жим)", 5.0, "спортзал", "понеділок", "link_to_image1", 8, 'раз', 4, "Станьте прямо, штанга на плечах. Віджимайте штангу вгору до повного випрямлення рук, потім опускайте до плечей. Додавайте вагу на тренажер з кожним підходом.", "дельтовидні м’язи, трицепси, трапецієвидні м’язи", 1),
    (126, "Біцепсовий жим зі штангою", 4.0, "спортзал", "понеділок", "link_to_image1", 6, 'раз', 4, "Станьте прямо, штанга в руках. Згинайте руки в ліктях, піднімаючи штангу до плечей, потім опускайте. Додавайте вагу на тренажер з кожним підходом.", "біцепси, передпліччя", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (121, 4), -- Станова тяга - проблеми з суглобами
    (122, 3), -- Жим штанги лежачи - проблеми з серцем
    (123, 4), -- Присідання зі штангою - проблеми з суглобами
    (125, 4); -- Жим штанги стоячи (військовий жим) - проблеми з суглобами

# середа дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (127, "Віджимання", 4.0, "дім", "середа", "link_to_image1", 15, 'раз', 3, "Ляжте обличчям вниз, руки на ширині плечей. Віджимайтеся, поки руки не випростаються, тримайте тіло прямим.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (128, "Присідання", 4.0, "дім", "середа", "link_to_image1", 12, 'раз', 4, "Станьте прямо, ноги на ширині плечей. Присідайте, поки стегна не будуть паралельні підлозі.", "квадрицепси, сідничні м’язи, задня частина стегон", 1),
    (129, "Планка", 3.0, "дім", "середа", "link_to_image1", 1, 'хв', 3, "Ляжте обличчям вниз, спираючись на передпліччя та носки. Тримайте тіло прямим, напружуючи м’язи живота.", "прес, спина, плечі", 1),
    (130, "Бічна планка", 3.0, "дім", "середа", "link_to_image1", 1, 'хв', 3, "Ляжте на бік, спираючись на одне передпліччя та стопу. Тримайте тіло прямим, напружуючи бічні м’язи живота.", "бічні м’язи живота, спина", 1),
    (131, "Підйоми ніг", 3.0, "дім", "середа", "link_to_image1", 15, 'раз', 4, "Ляжте на спину, руки вздовж тіла. Піднімайте прямі ноги вгору, потім повільно опускайте.", "прес, стегна", 1),
    (132, "Віджимання від стіни", 3.5, "дім", "середа", "link_to_image1", 15, 'раз', 4, "Станьте обличчям до стіни, руки на ширині плечей на стіні. Віджимайтеся, згинаючи лікті.", "грудні м’язи, трицепси", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (127, 3), -- Віджимання - проблеми з серцем
    (128, 4), -- Присідання - проблеми з суглобами
    (129, 1); -- Планка - астма
    
# середа спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (133, "Присідання зі штангою", 6.0, "спортзал", "середа", "link_to_image1", 8, 'раз', 4, "Станьте рівно, поставте ноги на ширині плечей, тримайте штангу на плечах. Присідайте, поки стегна не будуть паралельні підлозі, потім повертайтеся у вихідне положення. Додавайте вагу на тренажер з кожним підходом.", "квадрицепси, сідничні м’язи, задня частина стегон, спина", 1),
    (134, "Жим лежачи", 6.0, "спортзал", "середа", "link_to_image1", 8, 'раз', 4, "Ляжте на лавку, ноги на підлозі. Візьміть штангу широким хватом і опустіть її до середини грудей, потім витисніть назад. Додавайте вагу на тренажер з кожним підходом.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (135, "Тяга штанги в нахилі", 6.0, "спортзал", "середа", "link_to_image1", 8, 'раз', 4, "Нахиліться, тримаючи спину прямою, візьміть штангу і тягніть її до живота, потім опустіть. Додавайте вагу на тренажер з кожним підходом.", "широчезні м’язи спини, біцепси, задня частина плечей", 1),
    (136, "Станова тяга", 6.0, "спортзал", "середа", "link_to_image1", 8, 'раз', 4, "Станьте перед штангою, ноги на ширині плечей. Нахиліться і візьміть штангу, тримаючи спину прямою, підніміть її, тримаючи вагу на п’ятах, потім опустіть. Додавайте вагу на тренажер з кожним підходом.", "сідничні м’язи, квадрицепси, спина, задня частина стегон", 1),
    (137, "Віджимання на брусах", 6.0, "спортзал", "середа", "link_to_image1", 10, 'раз', 4, "Візьміться за бруси, тримайте тіло прямо і опустіться, поки лікті не стануть під кутом 90 градусів, потім підніміться.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (138, "Підтягування", 6.0, "спортзал", "середа", "link_to_image1", 10, 'раз', 4, "Візьміться за перекладину широким хватом і підтягніться, поки підборіддя не буде над перекладиною, потім опустіться.", "широчезні м’язи спини, біцепси, задня частина плечей", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (133, 4), -- Присідання зі штангою - проблеми з суглобами
    (134, 3), -- Жим лежачи - проблеми з серцем
    (135, 4), -- Тяга штанги в нахилі - проблеми з суглобами
    (136, 4), -- Станова тяга - проблеми з суглобами
    (137, 3); -- Віджимання на брусах - проблеми з серцем
    
# п’ятниця дім
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (139, "Віджимання", 3.8, "дім", "п’ятниця", "link_to_image1", 15, 'раз', 4, "Ляжте обличчям вниз, руки на ширині плечей. Підніміть тіло, випрямивши руки, потім опустіться до того моменту, поки груди не торкнуться підлоги.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (140, "Присідання", 5.0, "дім", "п’ятниця", "link_to_image1", 15, 'раз', 4, "Станьте рівно, ноги на ширині плечей. Присідайте, поки стегна не будуть паралельні підлозі, потім повертайтеся у вихідне положення.", "квадрицепси, сідничні м’язи, задня частина стегон", 1),
    (141, "Планка", 2.5, "дім", "п’ятниця", "link_to_image1", 1, 'хв', 3, "Ляжте обличчям вниз, спираючись на передпліччя та носки. Тримайте тіло прямим, як дошка, і утримуйте позицію.", "прес, спина, плечі", 1),
    (142, "Випади", 2.8, "дім", "п’ятниця", "link_to_image1", 15, 'раз', 4, "Станьте рівно, зробіть крок вперед однією ногою і присідайте, поки задня коліно не торкнеться підлоги. Повертайтеся у вихідне положення і повторіть на іншу ногу.", "квадрицепси, сідничні м’язи, задня частина стегон", 1),
    (143, "Підйом тулуба", 3.8, "дім", "п’ятниця", "link_to_image1", 15, 'раз', 3, "Ляжте на спину, коліна зігнуті, стопи на підлозі. Підніміть верхню частину тулуба до колін, потім повільно опустіться.", "прес", 1),
    (144, "Віджимання від стіни", 3.5, "дім", "п’ятниця", "link_to_image1", 12, 'раз', 4, "Станьте на відстані витягнутої руки від стіни, руки на ширині плечей на стіні. Опустіться до стіни, зігнувши лікті, потім випряміть руки.", "грудні м’язи, трицепси, передня частина плечей", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (139, 3), -- Віджимання - проблеми з серцем
    (140, 4), -- Присідання - проблеми з суглобами
    (141, 3); -- Планка - проблеми з серцем

# п’ятниця спортзал
INSERT INTO `exercise` (`id`, `name`, `MET`, `type`, `training_day`, `image_link`, `number_of_repetitions`, `measurement`, `number_of_approaches`, `description`, `muscle_groups_trained`, `training_type_id`)
VALUES 
    (145, "Мертва тяга", 6.0, "спортзал", "п’ятниця", "link_to_image1", 8, 'раз', 4, "Станьте перед штангою, ноги на ширині плечей. Нахиліться і візьміть штангу, тримаючи спину прямою, підніміть її, тримаючи вагу на п’ятах, потім опустіть. Додавайте вагу на тренажер з кожним підходом.", "сідничні м’язи, квадрицепси, спина, задня частина стегон", 1),
    (146, "Жим штанги на лавці під нахилом", 5.0, "спортзал", "п’ятниця", "link_to_image1", 8, 'раз', 4, "Ляжте на лавку з нахилом, ноги на підлозі. Візьміть штангу широким хватом і опустіть її до верхньої частини грудей, потім витисніть назад. Додавайте вагу на тренажер з кожним підходом.", "верхні грудні м’язи, передня частина плечей, трицепси", 1),
    (147, "Тяга штанги до пояса стоячи", 6.0, "спортзал", "п’ятниця", "link_to_image1", 8, 'раз', 4, "Станьте рівно, тримайте штангу перед собою. Тягніть штангу до пояса, тримаючи лікті близько до тіла, потім опустіть. Додавайте вагу на тренажер з кожним підходом.", "широчезні м’язи спини, біцепси, задня частина плечей", 1),
    (148, "Віджимання від підлоги на брусах", 5.0, "спортзал", "п’ятниця", "link_to_image1", 12, 'раз', 4, "Візьміться за бруси, тримайте тіло прямо і опустіться, поки лікті не стануть під кутом 90 градусів, потім підніміться.", "грудні м’язи, трицепси, передня частина плечей", 1),
    (149, "Підтягування широким хватом", 6.0, "спортзал", "п’ятниця", "link_to_image1", 10, 'раз', 4, "Візьміться за перекладину широким хватом і підтягніться, поки підборіддя не буде над перекладиною, потім опустіться.", "широчезні м’язи спини, біцепси, задня частина плечей", 1),
    (150, "Жим штанги стоячи (військовий жим)", 5.0, "спортзал", "п’ятниця", "link_to_image1", 8, 'раз', 4, "Станьте рівно, тримайте штангу на рівні плечей. Витисніть штангу над головою до повного випрямлення рук, потім поверніть у вихідне положення. Додавайте вагу на тренажер з кожним підходом.", "дельтовидні м’язи, трицепси, трапецієвидні м’язи", 1);

INSERT INTO `exercise_diseases` (`exercise_id`, `disease_id`)
VALUES
    (145, 4), -- Мертва тяга - проблеми з суглобами
    (146, 4), -- Жим штанги на лавці під нахилом - проблеми з суглобами
    (147, 4), -- Тяга штанги до пояса стоячи - проблеми з суглобами
    (148, 3); -- Віджимання від підлоги на брусах - проблеми з серцем