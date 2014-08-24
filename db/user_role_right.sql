CREATE TABLE `users` (
`ID` char(36) NOT NULL,
`Email` varchar(200) NOT NULL,
`Password` varchar(200) NOT NULL,
`RealName` varchar(200) NOT NULL,
`Status` int NOT NULL,
`CreateTime` datetime NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `user_infos` (
`ID` char(36) NOT NULL,
`NowLoginTime` datetime NOT NULL,
`LastLoginTime` datetime NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `roles` (
`ID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `rights` (
`ID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `user_roles` (
`ID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `role_rights` (
`ID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `user_rights` (
`ID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `groups` (
`ID` char(36) NOT NULL,
`Name` varchar(200) NOT NULL,
`Description` varchar(2000) NOT NULL,
`Status` int NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `group_roles` (
`ID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`roleID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `group_users` (
`ID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`userID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `group_rights` (
`ID` char(36) NOT NULL,
`groupID` char(36) NOT NULL,
`rightID` char(36) NOT NULL,
PRIMARY KEY (`ID`) 
);

CREATE TABLE `right_logs` (
`ID` char(36) NOT NULL,
`OperatorID` char(36) NOT NULL,
`TableName` varchar(200) NOT NULL,
`RowID` char(36) NOT NULL,
`Action` int NOT NULL COMMENT '1：增\r\n2：删\r\n3：改',
`Description` varchar(2000) NOT NULL,
`CreateTime` datetime NOT NULL,
PRIMARY KEY (`ID`) 
);


ALTER TABLE `user_infos` ADD CONSTRAINT `user_infos_users_fkid` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`);
ALTER TABLE `user_rights` ADD CONSTRAINT `user_rights_users_fkid` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);
ALTER TABLE `user_rights` ADD CONSTRAINT `user_rights_rights_fkid` FOREIGN KEY (`rightID`) REFERENCES `rights` (`ID`);
ALTER TABLE `role_rights` ADD CONSTRAINT `role_rights_roles_fkid` FOREIGN KEY (`roleID`) REFERENCES `roles` (`ID`);
ALTER TABLE `role_rights` ADD CONSTRAINT `role_rights_rights_fkid` FOREIGN KEY (`rightID`) REFERENCES `rights` (`ID`);
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_users_fkid` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_roles_fkid` FOREIGN KEY (`roleID`) REFERENCES `roles` (`ID`);
ALTER TABLE `group_rights` ADD CONSTRAINT `group_rights_groups_fkid` FOREIGN KEY (`groupID`) REFERENCES `groups` (`ID`);
ALTER TABLE `group_rights` ADD CONSTRAINT `group_rights_rights_fkid` FOREIGN KEY (`rightID`) REFERENCES `rights` (`ID`);
ALTER TABLE `group_users` ADD CONSTRAINT `group_users_groups_fkid` FOREIGN KEY (`groupID`) REFERENCES `groups` (`ID`);
ALTER TABLE `group_users` ADD CONSTRAINT `group_users_users_fkid` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);
ALTER TABLE `group_roles` ADD CONSTRAINT `group_roles_groups_fkid` FOREIGN KEY (`groupID`) REFERENCES `groups` (`ID`);
ALTER TABLE `group_roles` ADD CONSTRAINT `group_roles_roles_fkid` FOREIGN KEY (`roleID`) REFERENCES `roles` (`ID`);
ALTER TABLE `right_logs` ADD CONSTRAINT `right_logs_users_fkid` FOREIGN KEY (`OperatorID`) REFERENCES `users` (`ID`);

