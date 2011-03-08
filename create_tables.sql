delimiter $$

CREATE TABLE `libraries` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$


delimiter $$

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `image_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isbn` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `caption` varchar(8192) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `images_book_image_unq` (`book_id`,`image_id`),
  KEY `fk_images_library` (`library_id`),
  CONSTRAINT `fk_images_library` FOREIGN KEY (`library_id`) REFERENCES `libraries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$


delimiter $$

CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(16384) COLLATE utf8_unicode_ci NOT NULL,
  `is_current` tinyint(1) DEFAULT '0',
  `submitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'anonymous',
  `date_approved` datetime DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_descriptions_image` (`image_id`),
  CONSTRAINT `fk_descriptions_image` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$
