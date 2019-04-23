CREATE DATABASE IF NOT EXISTS `books` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `books`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `book_author` (
  `book` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `book_category` (
  `book` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `book_price` (
  `book` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `book_year` (
  `book` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `book_author`
  ADD KEY `book_author` (`book`);

ALTER TABLE `book_category`
  ADD KEY `book_category` (`book`);

ALTER TABLE `book_price`
  ADD UNIQUE KEY `book` (`book`);

ALTER TABLE `book_year`
  ADD UNIQUE KEY `book` (`book`);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);


ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `book_price`
  ADD CONSTRAINT `book_price` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `book_year`
  ADD CONSTRAINT `book_year` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
