-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 07, 2011 at 02:45 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.2-1ubuntu4.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `silverstripe245`
--

-- --------------------------------------------------------

--
-- Table structure for table `Email_BounceRecord`
--

CREATE TABLE IF NOT EXISTS `Email_BounceRecord` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Email_BounceRecord') DEFAULT 'Email_BounceRecord',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `BounceEmail` varchar(50) DEFAULT NULL,
  `BounceTime` datetime DEFAULT NULL,
  `BounceMessage` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Email_BounceRecord`
--


-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE IF NOT EXISTS `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE IF NOT EXISTS `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Image','Folder','Image_Cached') DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `Created`, `LastEdited`, `Name`, `Title`, `Filename`, `Content`, `Sort`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2011-05-07 02:25:46', '2011-05-07 02:25:46', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 0, 0, 0),
(2, 'Image', '2011-05-07 02:25:46', '2011-05-07 02:25:46', 'SilverStripeLogo.png', 'SilverStripeLogo.png', 'assets/Uploads/SilverStripeLogo.png', NULL, 0, 1, 0),
(3, 'File', '2011-05-07 02:25:46', '2011-05-07 02:25:46', 'error-404.html', 'error-404.html', 'assets/error-404.html', NULL, 0, 0, 0),
(4, 'File', '2011-05-07 02:25:46', '2011-05-07 02:25:46', 'error-500.html', 'error-500.html', 'assets/error-500.html', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE IF NOT EXISTS `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(50) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `IPRestrictions` mediumtext,
  `HtmlEditorConfig` varchar(50) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `IPRestrictions`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, NULL, 0),
(2, 'Group', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'Administrators', NULL, 'administrators', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE IF NOT EXISTS `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE IF NOT EXISTS `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Group_Roles`
--


-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE IF NOT EXISTS `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LoginAttempt`
--


-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(50) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `Bounced` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AutoLoginHash` varchar(50) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `Bounced`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`) VALUES
(1, 'Member', '2011-05-07 14:25:46', '2011-05-07 14:26:10', 'Default Admin', NULL, 'email', 'cefd554ca33b2dd2d7bae04e42b5d7bedfc08517', NULL, 1, '2011-05-07 02:26:29', 0, NULL, NULL, 'sha1_v2.4', 'e813d44b16af7b3844b762d64279e03b073a8600', NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE IF NOT EXISTS `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `Created`, `LastEdited`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'cefd554ca33b2dd2d7bae04e42b5d7bedfc08517', 'e813d44b16af7b3844b762d64279e03b073a8600', 'sha1_v2.4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageComment`
--

CREATE TABLE IF NOT EXISTS `PageComment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PageComment') DEFAULT 'PageComment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Comment` mediumtext,
  `IsSpam` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NeedsModeration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CommenterURL` varchar(255) DEFAULT NULL,
  `SessionID` varchar(255) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageComment`
--


-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'CMS_ACCESS_CommentAdmin', 0, 1, 1),
(4, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(5, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'SITETREE_REORGANISE', 0, 1, 1),
(6, 'Permission', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE IF NOT EXISTS `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRole`
--


-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRoleCode`
--


-- --------------------------------------------------------

--
-- Table structure for table `QueuedEmail`
--

CREATE TABLE IF NOT EXISTS `QueuedEmail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('QueuedEmail') DEFAULT 'QueuedEmail',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Send` datetime DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `From` varchar(50) DEFAULT NULL,
  `Content` mediumtext,
  `ToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ToID` (`ToID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `QueuedEmail`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE IF NOT EXISTS `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SiteConfig', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'Your Site Name', 'your tagline here', NULL, 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_CreateTopLevelGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_ViewerGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE IF NOT EXISTS `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) DEFAULT NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) DEFAULT NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ToDo` mediumtext,
  `Version` int(11) NOT NULL DEFAULT '0',
  `Priority` varchar(5) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaTitle`, `MetaDescription`, `MetaKeywords`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `HomepageForDomain`, `ProvideComments`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `Status`, `ReportClass`, `CanViewType`, `CanEditType`, `ToDo`, `Version`, `Priority`, `ParentID`) VALUES
(1, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(2, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(3, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(4, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(5, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_ImageTracking`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_LinkTracking`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) DEFAULT NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) DEFAULT NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ToDo` mediumtext,
  `Version` int(11) NOT NULL DEFAULT '0',
  `Priority` varchar(5) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaTitle`, `MetaDescription`, `MetaKeywords`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `HomepageForDomain`, `ProvideComments`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `Status`, `ReportClass`, `CanViewType`, `CanEditType`, `ToDo`, `Version`, `Priority`, `ParentID`) VALUES
(1, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(2, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(3, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(4, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:49', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0),
(5, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE IF NOT EXISTS `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaTitle` varchar(255) DEFAULT NULL,
  `MetaDescription` mediumtext,
  `MetaKeywords` varchar(255) DEFAULT NULL,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) DEFAULT NULL,
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ToDo` mediumtext,
  `Priority` varchar(5) DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaTitle`, `MetaDescription`, `MetaKeywords`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `HomepageForDomain`, `ProvideComments`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `Status`, `ReportClass`, `CanViewType`, `CanEditType`, `ToDo`, `Priority`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0),
(2, 2, 1, 1, 0, 0, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0),
(3, 3, 1, 1, 0, 0, 'Page', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, NULL, 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2011-05-07 14:25:46', '2011-05-07 14:25:46', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE IF NOT EXISTS `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Widget`
--

CREATE TABLE IF NOT EXISTS `Widget` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Widget') DEFAULT 'Widget',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `WidgetArea`
--

CREATE TABLE IF NOT EXISTS `WidgetArea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WidgetArea') DEFAULT 'WidgetArea',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WidgetArea`
--

