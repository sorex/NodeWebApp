CREATE TABLE `users` (
`UUID` char(36) NOT NULL,
`Email` varchar(200) NOT NULL,
`Password` varchar(200) NOT NULL,
`RealName` varchar(200) NOT NULL,
`Status` int NOT NULL,
`CreateTime` datetime NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `user_infos` (
`UUID` char(36) NOT NULL,
`NowLoginTime` datetime NOT NULL,
`LastLoginTime` datetime NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `roles` (
`UUID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `rights` (
`UUID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `user_roles` (
`UUID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `role_rights` (
`UUID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `user_rights` (
`UUID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `groups` (
`UUID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `group_roles` (
`UUID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `group_users` (
`UUID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);

CREATE TABLE `group_rights` (
`UUID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`UUID`) 
);


ALTER TABLE `user_infos` ADD FOREIGN KEY (`UUID`) REFERENCES `users` (`UUID`);
ALTER TABLE `user_rights` ADD FOREIGN KEY (`userID`) REFERENCES `users` (`UUID`);
ALTER TABLE `user_rights` ADD FOREIGN KEY (`rightID`) REFERENCES `rights` (`UUID`);
ALTER TABLE `role_rights` ADD FOREIGN KEY (`roleID`) REFERENCES `roles` (`UUID`);
ALTER TABLE `role_rights` ADD FOREIGN KEY (`rightID`) REFERENCES `rights` (`UUID`);
ALTER TABLE `user_roles` ADD FOREIGN KEY (`userID`) REFERENCES `users` (`UUID`);
ALTER TABLE `user_roles` ADD FOREIGN KEY (`roleID`) REFERENCES `roles` (`UUID`);
ALTER TABLE `group_rights` ADD FOREIGN KEY (`groupID`) REFERENCES `groups` (`UUID`);
ALTER TABLE `group_rights` ADD FOREIGN KEY (`rightID`) REFERENCES `rights` (`UUID`);
ALTER TABLE `group_users` ADD FOREIGN KEY (`groupID`) REFERENCES `groups` (`UUID`);
ALTER TABLE `group_users` ADD FOREIGN KEY (`userID`) REFERENCES `users` (`UUID`);
ALTER TABLE `group_roles` ADD FOREIGN KEY (`groupID`) REFERENCES `groups` (`UUID`);
ALTER TABLE `group_roles` ADD FOREIGN KEY (`roleID`) REFERENCES `roles` (`UUID`);

