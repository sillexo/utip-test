-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 03 2020 г., 07:28
-- Версия сервера: 10.1.35-MariaDB
-- Версия PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `utip`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `author_id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'Quaerat praesentium qui aliquam voluptatibus.', '', '2020-08-03 00:23:49', '2020-08-03 00:23:49'),
(2, 9, 'Qui quibusdam nihil nulla cum officia.', '', '2020-08-03 00:23:49', '2020-08-03 00:23:49'),
(3, 3, 'Repellendus consectetur eum magni nihil qui aut.', '', '2020-08-03 00:23:49', '2020-08-03 00:23:49'),
(4, 9, 'Quis deleniti ab molestiae rerum.', '', '2020-08-03 00:23:49', '2020-08-03 00:23:49'),
(5, 1, 'Recusandae explicabo autem ab.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(6, 7, 'Vel voluptas dolorem fugiat est et.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(7, 9, 'Maiores corporis cum soluta.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(8, 7, 'Praesentium enim ut incidunt explicabo.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(9, 9, 'Aliquid et totam quod.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(10, 3, 'Aut itaque repudiandae et.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(11, 5, 'Labore veniam tempora amet consectetur quo.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(12, 3, 'Non a eaque ab.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(13, 9, 'Ex et et repellendus quaerat.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(14, 5, 'Corrupti cumque saepe quia.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(15, 7, 'Praesentium harum earum ullam.', '', '2020-08-03 00:23:50', '2020-08-03 00:23:50');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `article_id`, `author_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 'Eos velit voluptatem magni sit nostrum earum molestias. Mollitia aut fugit eum consequatur quas. Distinctio voluptatum sint rerum et non. Esse rerum exercitationem consequatur.', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(2, 1, 1, 'Aliquid minus numquam magnam aliquid necessitatibus. Reiciendis quia atque eum. Dolores sit ut atque dolorem. Quis omnis non ut alias ut asperiores exercitationem.', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(3, 1, 7, 'Et nemo aut incidunt officia. Tempora inventore possimus autem maiores provident. Et tempore neque est est sint voluptates. Tenetur quidem facere enim soluta cupiditate laborum.', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(4, 1, 5, 'Similique cumque tempora dolor perferendis rerum occaecati esse. Quas dolor eveniet beatae perspiciatis quod dignissimos. Minus ad quas sit quasi qui blanditiis consectetur.', '2020-08-03 00:23:50', '2020-08-03 00:23:50'),
(5, 3, 3, 'Harum qui quibusdam facilis et voluptatem autem magnam. At dolor et harum. Ut et ea omnis nihil sit aut. Recusandae et vel maxime totam consequatur tenetur.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(6, 9, 1, 'Iusto aperiam vitae ducimus aut modi neque. Unde quia saepe temporibus ad velit repellat ducimus.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(7, 9, 9, 'Praesentium sit qui dolorum a molestiae. Minus dolorem repellendus cupiditate reiciendis. Corrupti dolorem fugiat corrupti in qui nesciunt commodi iusto.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(8, 3, 9, 'Nihil rem officiis id consequatur est vel corporis porro. Laborum iste eaque rerum quae consequatur aut. Ut labore qui ullam dolorum et rerum.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(9, 7, 7, 'Est maiores dignissimos optio est consectetur dolores inventore. Aperiam minima nemo voluptatum magnam. Nisi sed molestias enim dolor eos eius sit.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(10, 3, 3, 'Cum velit suscipit ut est atque dolores. Fuga ut voluptatem perferendis cumque. Neque ratione laboriosam exercitationem sapiente facilis similique. Voluptatem rerum explicabo in architecto.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(11, 9, 5, 'Veniam odit occaecati nisi nisi corrupti ipsum rerum. Non pariatur et necessitatibus. Ad culpa quam commodi soluta in est iste quia. Ut dolor voluptas expedita corporis aut.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(12, 1, 5, 'Laudantium aliquam non occaecati dolores ut cum pariatur. Provident ea optio exercitationem reiciendis hic eum molestiae. Earum possimus voluptas dolor vero distinctio.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(13, 3, 5, 'Illum ut alias alias voluptatem dignissimos officiis. Provident dolor eligendi nesciunt molestiae eveniet dolores iure commodi. Blanditiis quaerat sit magni aut itaque. Odio modi eos non earum amet.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(14, 3, 3, 'Est quam cupiditate est ea dolor. Consequatur cumque debitis qui accusamus et. Iure corporis ut incidunt rerum quia nihil.', '2020-08-03 00:23:51', '2020-08-03 00:23:51'),
(15, 1, 5, 'Voluptatem dolorem pariatur laborum qui. Omnis illum tempora et beatae itaque et. Quibusdam consequatur quas sed voluptatem totam quam modi.', '2020-08-03 00:23:51', '2020-08-03 00:23:51');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_10_21_190000_create_roles_table', 1),
(4, '2017_09_06_063000_create_articles_table', 1),
(5, '2017_09_06_064000_create_comments_table', 1),
(6, '2017_11_26_015000_create_user_role_table', 1),
(7, '2019_09_19_143226_create_user_profile_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`) VALUES
(1, 'admin', 'Администратор'),
(2, 'manager', 'Менеджер'),
(3, 'user', 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_token` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_token`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@test.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:46', '2020-08-03 00:23:46'),
(2, 'Manager', 'manager@test.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:46', '2020-08-03 00:23:46'),
(3, 'User', 'user@test.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:46', '2020-08-03 00:23:46'),
(4, 'Blocked User', 'blocked_user@test.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '0', NULL, '2020-08-03 00:23:47', '2020-08-03 00:23:47'),
(5, 'Charley Tillman', 'ebony80@oreilly.net', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:47', '2020-08-03 00:23:47'),
(6, 'Jovanny Hand', 'gleichner.milan@gmail.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(7, 'Kameron Treutel', 'efren98@hotmail.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(8, 'Nestor Morar', 'genesis11@hotmail.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(9, 'Larry Barton', 'marks.precious@gmail.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(10, 'Melany Lindgren PhD', 'moises.aufderhar@nader.info', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(11, 'Halle Sauer', 'hillary87@yost.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(12, 'D\'angelo Volkman', 'jennie09@hotmail.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(13, 'Abe Kirlin V', 'heller.mafalda@denesik.info', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(14, 'Toney Marquardt', 'emmerich.joan@boyle.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(15, 'Dr. Kaylin Brown', 'trevor20@marvin.biz', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48'),
(16, 'Otha Schuster', 'maybelle28@connelly.com', NULL, NULL, '$2y$10$5k.ge8ZMU1FivPbSqDiSguF5sMb8eX6iZktik.JyPmr84w1y86iVG', '1', NULL, '2020-08-03 00:23:48', '2020-08-03 00:23:48');

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `address`, `phone`) VALUES
(1, 1, '63695 Katarina Meadow Suite 661\nNew Estellachester, PA 73868', '+3493733211462'),
(2, 2, '86215 Ramona Mill\nLindgrenfurt, WV 24438', '+2986075331476'),
(3, 3, '43812 Pfannerstill Row\nPort Issac, KY 15702', '+9706043304889'),
(4, 4, '54395 Harris Glens Apt. 860\nValentinview, ME 51813-7340', '+4402697287149'),
(5, 5, '148 Hansen Inlet\nCristopherburgh, NJ 97658', '+8908415076818'),
(6, 6, '9900 Burdette Shoal\nGusikowskishire, NH 34857-1833', '+2576544942181'),
(7, 7, '352 Roxanne Isle\nSouth Maxine, NM 51420-8857', '+4218750693989'),
(8, 8, '714 Hyatt Burg Apt. 631\nEast Nina, TN 58145-4875', '+9915775255216'),
(9, 9, '32171 Eichmann Alley Suite 597\nBradlyburgh, MT 20412-5485', '+6221766320255'),
(10, 10, '719 Parisian Corners\nFritschfurt, MN 91309', '+7782223564639'),
(11, 11, '63973 Daisy Cape Apt. 833\nLake Sasha, NC 04325', '+9604039004797'),
(12, 12, '1944 Vandervort Throughway Apt. 282\nFaymouth, OK 25679', '+5982299804496'),
(13, 13, '7111 Gavin Flat Suite 243\nNorth Cletusmouth, TX 56483', '+5364320794690'),
(14, 14, '16182 Breanna Plains\nReinholdville, VA 45887', '+7682133381327'),
(15, 15, '924 Kautzer Bridge\nEast Rafaelaburgh, RI 24707', '+5830991343829'),
(16, 16, '903 Cordia Curve\nLoganville, KS 38030', '+5301900115047');

-- --------------------------------------------------------

--
-- Структура таблицы `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
