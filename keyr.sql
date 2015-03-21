-- phpMyAdmin SQL Dump
-- version 4.2.9.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2014 at 01:06 PM
-- Server version: 5.6.21-log
-- PHP Version: 5.6.2-pl0-gentoo

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pgp`
--

-- --------------------------------------------------------

--
-- Table structure for table `keys_dsa`
--

CREATE TABLE IF NOT EXISTS `keys_dsa` (
`id` mediumint(3) unsigned NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `keyid_short` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid_master` varchar(16) COLLATE ascii_bin NOT NULL,
  `alg` varchar(8) COLLATE ascii_bin NOT NULL,
  `dsa_p` varchar(1024) COLLATE ascii_bin NOT NULL,
  `dsa_q` varchar(1024) COLLATE ascii_bin NOT NULL,
  `dsa_g` varchar(1024) COLLATE ascii_bin NOT NULL,
  `dsa_y` varchar(1024) COLLATE ascii_bin NOT NULL,
  `dsa_bits` smallint(2) unsigned NOT NULL,
  `ver` tinyint(1) unsigned NOT NULL,
  `sub` tinyint(1) unsigned NOT NULL,
  `errors` set('p_notprime','q_notprime') COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `masteroffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `keys_ecc`
--

CREATE TABLE IF NOT EXISTS `keys_ecc` (
`id` mediumint(3) unsigned NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `keyid_short` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid_master` varchar(16) COLLATE ascii_bin NOT NULL,
  `alg` varchar(8) COLLATE ascii_bin NOT NULL,
  `ver` tinyint(1) unsigned NOT NULL,
  `curve_type` varchar(11) COLLATE ascii_bin NOT NULL,
  `curve_point` varchar(512) COLLATE ascii_bin NOT NULL,
  `sub` tinyint(1) unsigned NOT NULL,
  `errors` set('p_notprime','q_notprime') COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `masteroffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `keys_rsa`
--

CREATE TABLE IF NOT EXISTS `keys_rsa` (
`id` mediumint(3) unsigned NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `keyid_short` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid_master` varchar(16) COLLATE ascii_bin NOT NULL,
  `rsa_n` varchar(4096) COLLATE ascii_bin NOT NULL,
  `rsa_e` varchar(1024) COLLATE ascii_bin NOT NULL,
  `rsa_bits` smallint(2) unsigned NOT NULL,
  `ver` tinyint(1) unsigned NOT NULL,
  `sub` tinyint(1) unsigned NOT NULL,
  `errors` set('smallfact') COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `masteroffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sigs_dsa`
--

CREATE TABLE IF NOT EXISTS `sigs_dsa` (
`id` mediumint(3) unsigned NOT NULL,
  `dsa_r` varchar(1024) COLLATE ascii_bin NOT NULL,
  `dsa_s` varchar(1024) COLLATE ascii_bin NOT NULL,
  `sigtype` varchar(32) COLLATE ascii_bin NOT NULL,
  `hashbits` varchar(4) COLLATE ascii_bin NOT NULL,
  `hash` varchar(128) COLLATE ascii_bin NOT NULL,
  `pkalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `hashalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `master_keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `sigoffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sigs_ecc`
--

CREATE TABLE IF NOT EXISTS `sigs_ecc` (
`id` mediumint(3) unsigned NOT NULL,
  `dsa_r` varchar(256) COLLATE ascii_bin NOT NULL,
  `dsa_s` varchar(256) COLLATE ascii_bin NOT NULL,
  `sigtype` varchar(32) COLLATE ascii_bin NOT NULL,
  `hashbits` varchar(4) COLLATE ascii_bin NOT NULL,
  `hash` varchar(128) COLLATE ascii_bin NOT NULL,
  `pkalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `hashalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `master_keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `sigoffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sigs_rsa`
--

CREATE TABLE IF NOT EXISTS `sigs_rsa` (
  `id` mediumint(3) unsigned NOT NULL DEFAULT '0',
  `rsa_sig` varchar(1024) COLLATE ascii_bin NOT NULL,
  `sigtype` varchar(32) COLLATE ascii_bin NOT NULL,
  `hashbits` varchar(4) COLLATE ascii_bin NOT NULL,
  `hash` varchar(128) COLLATE ascii_bin NOT NULL,
  `pkalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `hashalg` varchar(8) COLLATE ascii_bin NOT NULL,
  `keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `master_keyid` varchar(16) COLLATE ascii_bin NOT NULL,
  `file` varchar(32) COLLATE ascii_bin NOT NULL,
  `keyoffset` int(4) unsigned NOT NULL,
  `sigoffset` int(4) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys_dsa`
--
ALTER TABLE `keys_dsa`
 ADD PRIMARY KEY (`id`), ADD KEY `keyid` (`keyid`(4)), ADD KEY `dsa_p` (`dsa_p`(16)), ADD KEY `dsa_q` (`dsa_q`(16)), ADD KEY `dsa_g` (`dsa_g`(16)), ADD KEY `dsa_y` (`dsa_y`(16));

--
-- Indexes for table `keys_ecc`
--
ALTER TABLE `keys_ecc`
 ADD PRIMARY KEY (`id`), ADD KEY `curve_point` (`curve_point`(16));

--
-- Indexes for table `keys_rsa`
--
ALTER TABLE `keys_rsa`
 ADD PRIMARY KEY (`id`), ADD KEY `keyid` (`keyid`(4)), ADD KEY `rsa_n` (`rsa_n`(16)), ADD KEY `rsa_e` (`rsa_e`(4));

--
-- Indexes for table `sigs_dsa`
--
ALTER TABLE `sigs_dsa`
 ADD PRIMARY KEY (`id`), ADD KEY `dsa_r` (`dsa_r`(16)), ADD KEY `dsa_s` (`dsa_s`(16));

--
-- Indexes for table `sigs_ecc`
--
ALTER TABLE `sigs_ecc`
 ADD PRIMARY KEY (`id`), ADD KEY `dsa_r` (`dsa_r`(16)), ADD KEY `dsa_s` (`dsa_s`(16));

--
-- Indexes for table `sigs_rsa`
--
ALTER TABLE `sigs_rsa`
 ADD KEY `rsa_sig` (`rsa_sig`(16));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys_dsa`
--
ALTER TABLE `keys_dsa`
MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys_ecc`
--
ALTER TABLE `keys_ecc`
MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys_rsa`
--
ALTER TABLE `keys_rsa`
MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sigs_dsa`
--
ALTER TABLE `sigs_dsa`
MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sigs_ecc`
--
ALTER TABLE `sigs_ecc`
MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
