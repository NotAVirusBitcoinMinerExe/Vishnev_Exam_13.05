-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 13 2024 г., 09:26
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vishnev_a_is1_45`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category_offeq`
--

CREATE TABLE `category_offeq` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `category_offeq`
--

INSERT INTO `category_offeq` (`category_id`, `category`) VALUES
(1, 'Устройства ввода'),
(2, 'Устройства вывода'),
(3, 'Компьютеры'),
(4, 'Переферия');

-- --------------------------------------------------------

--
-- Структура таблицы `entry`
--

CREATE TABLE `entry` (
  `entry_id` int(11) NOT NULL,
  `entry_offeq` int(11) NOT NULL,
  `entry_type` int(11) NOT NULL,
  `entry_creator` int(11) NOT NULL,
  `entry_datetime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `office_equipment`
--

CREATE TABLE `office_equipment` (
  `offeq_id` int(11) NOT NULL,
  `office_equipment` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `category_offeq` int(11) NOT NULL,
  `status_offeq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `office_equipment`
--

INSERT INTO `office_equipment` (`offeq_id`, `office_equipment`, `category_offeq`, `status_offeq`) VALUES
(1, 'MacBook 15', 3, 2),
(2, 'Graphics tablet\r\n', 1, 3),
(3, 'Keyboard DEXP', 4, 1),
(4, 'Monitor Sharp', 2, 2),
(5, 'Mouse Bloody', 4, 2),
(6, 'Computer Pentium 468', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'Клиент'),
(2, 'Админ');

-- --------------------------------------------------------

--
-- Структура таблицы `status_offeq`
--

CREATE TABLE `status_offeq` (
  `status_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `status_offeq`
--

INSERT INTO `status_offeq` (`status_id`, `status`) VALUES
(1, 'На складе'),
(2, 'В работе'),
(3, 'Списано');

-- --------------------------------------------------------

--
-- Структура таблицы `type_entry`
--

CREATE TABLE `type_entry` (
  `type_entry_id` int(11) NOT NULL,
  `type_entry` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `type_entry`
--

INSERT INTO `type_entry` (`type_entry_id`, `type_entry`) VALUES
(1, 'Приёмка'),
(2, 'Списание');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name_1` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `user_name_2` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `user_name_3` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_520_ci DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_name_1`, `user_name_2`, `user_name_3`, `user_email`, `user_password`, `user_role`) VALUES
(2, 'Ð’Ð¸ÑˆÐ½ÐµÐ²', 'ÐÐ»ÐµÐºÑÐµÐ¹', 'ÐÐ»ÐµÐºÑÐµÐµÐ²Ð¸Ñ‡', 'avisnev55@gmail.com', '1234', 2),
(3, 'Ð£Ð¹Ð¼Ð°Ð½Ð¾Ð²', 'Ð“Ð»ÐµÐ±', 'ÐŸÐµÑ‚Ñ€Ð¾Ð²Ð¸Ñ‡', 'Gleb@gmail.com', '0000', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category_offeq`
--
ALTER TABLE `category_offeq`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `entry_offeq` (`entry_offeq`,`entry_type`,`entry_creator`) USING BTREE,
  ADD KEY `entry_type` (`entry_type`),
  ADD KEY `entry_creator` (`entry_creator`);

--
-- Индексы таблицы `office_equipment`
--
ALTER TABLE `office_equipment`
  ADD PRIMARY KEY (`offeq_id`),
  ADD KEY `category_offeq` (`category_offeq`,`status_offeq`),
  ADD KEY `status_offeq` (`status_offeq`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `status_offeq`
--
ALTER TABLE `status_offeq`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `type_entry`
--
ALTER TABLE `type_entry`
  ADD PRIMARY KEY (`type_entry_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_role` (`user_role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category_offeq`
--
ALTER TABLE `category_offeq`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `entry`
--
ALTER TABLE `entry`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `office_equipment`
--
ALTER TABLE `office_equipment`
  MODIFY `offeq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status_offeq`
--
ALTER TABLE `status_offeq`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `type_entry`
--
ALTER TABLE `type_entry`
  MODIFY `type_entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `entry`
--
ALTER TABLE `entry`
  ADD CONSTRAINT `entry_ibfk_1` FOREIGN KEY (`entry_type`) REFERENCES `type_entry` (`type_entry_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entry_ibfk_2` FOREIGN KEY (`entry_creator`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entry_ibfk_3` FOREIGN KEY (`entry_offeq`) REFERENCES `office_equipment` (`offeq_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `office_equipment`
--
ALTER TABLE `office_equipment`
  ADD CONSTRAINT `office_equipment_ibfk_1` FOREIGN KEY (`status_offeq`) REFERENCES `status_offeq` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `office_equipment_ibfk_2` FOREIGN KEY (`category_offeq`) REFERENCES `category_offeq` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
