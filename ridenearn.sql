-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2014 at 05:37 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ridenearn`
--
CREATE DATABASE IF NOT EXISTS `ridenearn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ridenearn`;

-- --------------------------------------------------------

--
-- Table structure for table `rne_message`
--

CREATE TABLE IF NOT EXISTS `rne_message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `time_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_read` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rne_message_users`
--

CREATE TABLE IF NOT EXISTS `rne_message_users` (
  `mu_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_to_id` int(11) NOT NULL,
  `u_from_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  PRIMARY KEY (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rne_permission`
--

CREATE TABLE IF NOT EXISTS `rne_permission` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to_id` int(11) NOT NULL,
  `user_from_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rne_users`
--

CREATE TABLE IF NOT EXISTS `rne_users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(32) NOT NULL,
  `l_name` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar_url` varchar(100) NOT NULL DEFAULT 'avatar',
  `gender` char(1) NOT NULL,
  `rate` int(1) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `rne_users`
--

INSERT INTO `rne_users` (`u_id`, `f_name`, `l_name`, `email`, `avatar_url`, `gender`, `rate`) VALUES
(1, 'sankalp', 'chugh', 'sankalp.chugh@stu.upes.ac.in', '', 'm', 0),
(2, 'arunoday', 'ray', 'arunoday.ray@gmail.com', '', 'f', 0),
(3, 'sankalp', 'chugh', 'sankalp.chugh@gmail.com', 'avatar', 'm', 0),
(4, 'sankalp', 'chugh', 'sankalp.chugh@stu.upes.ac.in', 'avatar', 'm', 0),
(5, 'sankalp', 'chugh', 'sankalp.chugh@yahoo.com', 'avatar', 'm', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rne_vehicle`
--

CREATE TABLE IF NOT EXISTS `rne_vehicle` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `v_type` int(11) NOT NULL,
  `v_no` varchar(15) NOT NULL,
  `v2_type` int(11) DEFAULT NULL,
  `v2_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
