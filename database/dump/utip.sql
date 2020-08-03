-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 03 2020 г., 05:52
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
(1, 1, 'Hic labore veniam corrupti non.', '', '2020-08-02 22:43:28', '2020-08-02 22:43:28'),
(2, 5, 'Odit soluta modi distinctio incidunt.', '', '2020-08-02 22:43:28', '2020-08-02 22:43:28'),
(3, 3, 'Vitae aut nihil nobis et voluptatum.', '', '2020-08-02 22:43:28', '2020-08-02 22:43:28'),
(4, 7, 'Aspernatur totam aperiam ab dignissimos.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(5, 9, 'Enim laboriosam facilis corrupti.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(6, 7, 'Occaecati veniam praesentium necessitatibus beatae dolorum.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(7, 7, 'Esse qui assumenda aut.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(8, 5, 'Ea reprehenderit doloremque unde.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(9, 5, 'Tenetur amet sunt quia doloremque debitis consequatur.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(10, 9, 'Consequatur voluptas explicabo inventore voluptatem.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(11, 1, 'Qui vero non sed laudantium.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(12, 9, 'Corrupti consequatur sit ipsa laudantium.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(13, 5, 'Doloremque a maxime nesciunt officia.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(14, 7, 'Nostrum exercitationem autem architecto.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(15, 7, 'Ab est cum necessitatibus.', '', '2020-08-02 22:43:29', '2020-08-02 22:43:29');

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
(1, 3, 7, 'Voluptatem nobis ut quae mollitia debitis dicta. Et quaerat corporis ut reiciendis. Repellendus exercitationem ex sint omnis suscipit reprehenderit.', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(2, 9, 7, 'Deleniti tenetur molestias adipisci illo. Sit soluta commodi sequi molestiae. Expedita recusandae sequi tempore.', '2020-08-02 22:43:29', '2020-08-02 22:43:29'),
(3, 1, 3, 'Quas aperiam omnis hic consequuntur. Dicta illum rerum reprehenderit quia nam. Iusto sed commodi voluptatem aut quibusdam temporibus.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(4, 3, 7, 'Rem nihil sed consequatur ad aperiam animi. In consequatur veritatis cumque aliquam suscipit. Nulla eveniet ad dolor at sunt aut.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(5, 1, 5, 'Modi molestiae pariatur dicta saepe aut. Recusandae illo rerum voluptates hic. Dolore et tempora similique ullam omnis quis enim omnis. Culpa occaecati eum laborum et.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(6, 3, 1, 'Autem dicta ipsa dolores fugiat animi. Quo ipsa occaecati qui delectus. Deserunt molestiae dolores debitis voluptatem doloribus est est.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(7, 1, 3, 'Et aperiam rem rem pariatur. Deleniti expedita sed autem qui. Ut nihil praesentium natus repudiandae. Consequatur nesciunt eligendi amet rerum non nihil.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(8, 1, 1, 'Maiores repellendus minima sed minima. Maiores accusantium fuga eos et quod debitis vel. Quae consequuntur ullam voluptas recusandae. Alias quasi voluptatum numquam mollitia reprehenderit ut earum.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(9, 5, 7, 'Repudiandae asperiores sit perferendis ab repudiandae nostrum. Fuga debitis sequi laudantium sed quisquam. Et laudantium molestiae et debitis sed. Repudiandae dolores nulla aut id sint facere.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(10, 7, 9, 'Omnis et maxime assumenda ipsa voluptas saepe. Accusamus eum mollitia deserunt enim beatae accusamus. Fugiat quos laboriosam aspernatur cum et enim similique.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(11, 1, 5, 'Dolores vero et quisquam. Delectus pariatur dolorum enim accusantium. Quaerat quia dolor quis dolorem. Vitae quas recusandae adipisci mollitia optio.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(12, 5, 3, 'Voluptate perspiciatis odit minus exercitationem unde. Temporibus rerum similique ut velit in. Sed sit amet deserunt non quam velit autem corrupti. Saepe perferendis aliquam dolor impedit enim.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(13, 9, 5, 'Consequatur et doloremque nihil rerum dolor. Ut temporibus aut libero sit. Esse voluptas dolores enim et.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(14, 9, 1, 'Ducimus commodi animi et minima incidunt. Asperiores incidunt a sint aut voluptas assumenda. Eum quisquam explicabo nulla natus rem. Aut accusamus aut ratione necessitatibus est est consequatur.', '2020-08-02 22:43:30', '2020-08-02 22:43:30'),
(15, 3, 3, 'Dolor sequi ut quis quaerat quis deleniti. In natus ducimus omnis. Perspiciatis et ex laudantium amet tenetur.', '2020-08-02 22:43:30', '2020-08-02 22:43:30');

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
(1, 'Administrator', 'admin@test.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:26', '2020-08-02 22:43:26'),
(2, 'Manager', 'manager@test.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:26', '2020-08-02 22:43:26'),
(3, 'User', 'user@test.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:26', '2020-08-02 22:43:26'),
(4, 'Blocked User', 'blocked_user@test.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '0', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(5, 'Estefania Halvorson', 'xhills@frami.org', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(6, 'Cale Prohaska', 'bessie54@yahoo.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(7, 'Bret Kutch Jr.', 'jaquan15@hotmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(8, 'Prof. Arno Walker', 'tmante@hotmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(9, 'Blaise Herzog', 'lockman.chadd@gutmann.biz', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(10, 'Adam Vandervort', 'ivory06@gmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(11, 'Henri Jones', 'dolores.schoen@yahoo.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(12, 'Libby Hane', 'dwatsica@hotmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(13, 'Etha Jenkins', 'mitchell.jamal@hane.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(14, 'Dejon Goldner Sr.', 'myrtis42@jenkins.biz', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:27', '2020-08-02 22:43:27'),
(15, 'Prof. Juana Kuphal I', 'coreilly@gmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:28', '2020-08-02 22:43:28'),
(16, 'Prof. Frida Anderson', 'hohara@gmail.com', NULL, NULL, '$2y$10$hVEiWWWjZ2SKoI/BTxt9fOmJv9gtb93682yGRg1KhN2RaTdEdTjL2', '1', NULL, '2020-08-02 22:43:28', '2020-08-02 22:43:28');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
