-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 25 2020 г., 19:44
-- Версия сервера: 5.6.43
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testing`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `correct_answer` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`id`, `answer`, `question_id`, `correct_answer`) VALUES
(3, 'break;', 1, '1'),
(4, 'exit;', 1, '0'),
(5, 'continue;', 1, '0'),
(6, 'return', 1, '0'),
(7, '&', 2, '0'),
(8, '&&', 2, '0'),
(9, 'AND', 2, '0'),
(10, 'And', 2, '1'),
(11, '$str1.$str2', 3, '1'),
(12, 'cat($str1, $str2)', 3, '0'),
(13, '$str1 + $str2', 3, '0'),
(14, 'join($str1, $str2)', 3, '0'),
(15, 'Для детермінованого знищення об\'єктів типу', 4, '0'),
(16, 'У Finalize немає особливого призначення', 4, '0'),
(17, 'Finalize - аналог блоку finally', 4, '0'),
(18, 'Дозволяє об\'єкту виконати коректну очищення, перш ніж збирач сміття звільнить займану об\'єктом пам\'ять', 4, '1'),
(19, 'інше ім\'я методу', 5, '1'),
(20, 'інший тип повернутого значення', 5, '0'),
(21, 'інший тип параметрів', 5, '0'),
(22, 'інша кількість параметрів', 5, '0'),
(23, 'всього один', 6, '1'),
(24, 'не більше двох', 6, '0'),
(25, 'будь яка кількість', 6, '0'),
(26, 'truetest', 11, '1'),
(27, 'testtrue', 11, '0'),
(28, 'test', 11, '0'),
(29, 'true', 11, '0'),
(30, '18', 12, '1'),
(31, '1', 12, '0'),
(32, '0', 12, '0'),
(33, 'NAN', 12, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `question`, `test_id`) VALUES
(1, 'Яку керуючу конструкцію потрібно використовувати щоб достроково вийти з циклу foreach()?', 1),
(2, 'Що із зазначеного не є поданням логічного оператора AND в PHP?', 1),
(3, 'Яку з цих конструкцій потрібно використовувати щоб з\'єднати два рядки $ str1 і $ str2, в єдиний рядок?', 1),
(4, 'Для чого призначений метод Finalize?', 2),
(5, 'Якими способами з перерахованих не може бути перевантажений метод в C #?', 2),
(6, 'Скільки батьківських класів може мати похідний клас?', 2),
(11, 'Яку відповідь дасть функція alert(true + \"test\")?', 3),
(12, 'Яку відповідь дасть функція parseInt(1/0,19)?', 3),
(13, 'тестове питання', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`id`, `test_name`) VALUES
(1, 'PHP'),
(2, 'C#'),
(3, 'JavaScript'),
(4, 'пусте питання'),
(5, 'без відповідей');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`);

--
-- Индексы таблицы `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Ограничения внешнего ключа таблицы `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
