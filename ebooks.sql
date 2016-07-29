-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 07 月 29 日 23:38
-- 服务器版本: 5.5.38
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ebooks`
--

-- --------------------------------------------------------

--
-- 表的结构 `applaud`
--

CREATE TABLE IF NOT EXISTS `applaud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `bookid` int(10) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL,
  `press` varchar(30) NOT NULL,
  `abstracts` text NOT NULL,
  `download` varchar(500) NOT NULL COMMENT '下载链接',
  `img` varchar(100) NOT NULL COMMENT '封面图链接',
  PRIMARY KEY (`bookid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `usid` int(11) DEFAULT NULL COMMENT '用户ID',
  `bookid` int(11) DEFAULT NULL COMMENT '图书ID',
  `content` varchar(100) DEFAULT NULL COMMENT '评论内容',
  `time` datetime DEFAULT NULL COMMENT '评论时间',
  `answerusid` int(11) NOT NULL DEFAULT '0' COMMENT '回复者ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `dlid` int(11) NOT NULL AUTO_INCREMENT,
  `usid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  PRIMARY KEY (`dlid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `usid` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `email` varchar(30) DEFAULT NULL,
  `authority` varchar(2) NOT NULL,
  PRIMARY KEY (`usid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`usid`, `username`, `password`, `email`, `authority`) VALUES
(2, 'test2', '21232f297a57a5a743894a0e4a801fc3', '321@qq.com', '0'),
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@baal.xyz', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
