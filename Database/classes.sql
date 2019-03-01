CREATE TABLE `Product-Activity` (
  ID         int(10) NOT NULL AUTO_INCREMENT, 
  ActivityID int(10) NOT NULL, 
  ProductID  int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `Role-Product` (
  ID        int(10) NOT NULL AUTO_INCREMENT, 
  ProductID int(10) NOT NULL, 
  RoleID    int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `Activity-Role` (
  ID         int(10) NOT NULL AUTO_INCREMENT, 
  ActivityID int(10) NOT NULL, 
  RoleID     int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `Activity-Pattern` (
  ID         int(10) NOT NULL AUTO_INCREMENT, 
  PatternID  int(10) NOT NULL, 
  ActivityID int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `Group-Pattern` (
  ID        int(10) NOT NULL AUTO_INCREMENT, 
  PatternID int(10) NOT NULL, 
  GroupID   int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `Sentence-Group` (
  ID         int(10) NOT NULL AUTO_INCREMENT, 
  GroupID    int(10) NOT NULL, 
  SentenceID int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Pattern (
  ID              int(10) NOT NULL AUTO_INCREMENT, 
  UserID          int(10) NOT NULL, 
  PatternName     varchar(255) NOT NULL, 
  Image           blob, 
  Description     varchar(255) NOT NULL, 
  `Data Creation` date NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Permission (
  ID               int(10) NOT NULL AUTO_INCREMENT, 
  PermissionName   varchar(255), 
  PermissionActive bit(1) NOT NULL, 
  `Create`         bit(1) NOT NULL, 
  `Read`           bit(1) NOT NULL, 
  `Update`         bit(1) NOT NULL, 
  `Delete`         bit(1) NOT NULL, 
  Read_others      bit(1) NOT NULL, 
  Update_others    bit(1) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Role (
  ID       int(10) NOT NULL AUTO_INCREMENT, 
  RoleName varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE Product (
  ID          int(10) NOT NULL AUTO_INCREMENT, 
  ProductName varchar(255), 
  Tipo        char(1) NOT NULL, 
  Formato     varchar(255) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Process (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  ProcessName    varchar(255), 
  UserID         int(10) NOT NULL, 
  `Data Criação` date NOT NULL, 
  Descrição      varchar(255) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Activity (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  ActivityName varchar(255), 
  ProcessID    int(10) NOT NULL, 
  Descriçào    varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE `Group` (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  UserID       int(10) NOT NULL, 
  GroupName    varchar(255) UNIQUE, 
  CreationDate date, 
  Name         varchar(255) NOT NULL, 
  Description  varchar(255) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Sentence (
  ID            int(10) NOT NULL AUTO_INCREMENT, 
  UserID        int(10) NOT NULL, 
  SentenceName  varchar(255) NOT NULL, 
  DateCreated   date NOT NULL, 
  Subject       varchar(255) NOT NULL, 
  Receiver      varchar(255), 
  DataRealizado date NOT NULL, 
  Artefacto     varchar(255) NOT NULL, 
  VerbID        int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Profile (
  ID          int(10) NOT NULL AUTO_INCREMENT, 
  ProfileName varchar(255), 
  Active      bit(1) NOT NULL, 
  UserID      int(10) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE `User` (
  ID             int(10) NOT NULL AUTO_INCREMENT, 
  OrganizationID int(10) NOT NULL, 
  ProfileID      int(10) NOT NULL, 
  UserName       varchar(255), 
  UserEmail      varchar(255), 
  Password       varchar(255), 
  UserRole       varchar(255), 
  Active         bit(1) NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Organization (
  ID                   int(10) NOT NULL AUTO_INCREMENT, 
  OrganizationName     varchar(255), 
  OrganizationLocation varchar(255), 
  PRIMARY KEY (ID));
CREATE TABLE Tags (
  Name int(10), 
  ID   int(10) NOT NULL AUTO_INCREMENT, 
  PRIMARY KEY (ID), 
  INDEX (ID));
CREATE TABLE Group_Tags (
  GroupID int(10) NOT NULL, 
  TagsID  int(10) NOT NULL, 
  PRIMARY KEY (GroupID, 
  TagsID));
CREATE TABLE Profile_Permission (
  ProfileID    int(10) NOT NULL, 
  PermissionID int(10) NOT NULL, 
  PRIMARY KEY (ProfileID, 
  PermissionID));
CREATE TABLE Verb (
  ID       int(10) NOT NULL AUTO_INCREMENT, 
  VerbName varchar(255) NOT NULL UNIQUE, 
  VerbType varchar(255) NOT NULL, 
  PRIMARY KEY (ID), 
  INDEX (ID));
ALTER TABLE `Sentence-Group` ADD CONSTRAINT `FKSentence-G792806` FOREIGN KEY (GroupID) REFERENCES `Group` (ID);
ALTER TABLE `Sentence-Group` ADD CONSTRAINT `FKSentence-G10181` FOREIGN KEY (SentenceID) REFERENCES Sentence (ID);
ALTER TABLE `Product-Activity` ADD CONSTRAINT `FKProduct-Ac888053` FOREIGN KEY (ActivityID) REFERENCES Activity (ID);
ALTER TABLE `Product-Activity` ADD CONSTRAINT `FKProduct-Ac333381` FOREIGN KEY (ProductID) REFERENCES Product (ID);
ALTER TABLE `Activity-Role` ADD CONSTRAINT `FKActivity-R573192` FOREIGN KEY (ActivityID) REFERENCES Activity (ID);
ALTER TABLE `Activity-Role` ADD CONSTRAINT `FKActivity-R363829` FOREIGN KEY (RoleID) REFERENCES Role (ID);
ALTER TABLE `Role-Product` ADD CONSTRAINT `FKRole-Produ570114` FOREIGN KEY (ProductID) REFERENCES Product (ID);
ALTER TABLE `Role-Product` ADD CONSTRAINT `FKRole-Produ915423` FOREIGN KEY (RoleID) REFERENCES Role (ID);
ALTER TABLE Sentence ADD CONSTRAINT creates FOREIGN KEY (UserID) REFERENCES `User` (ID);
ALTER TABLE `Group-Pattern` ADD CONSTRAINT `FKGroup-Patt226691` FOREIGN KEY (GroupID) REFERENCES `Group` (ID);
ALTER TABLE `Activity-Pattern` ADD CONSTRAINT `FKActivity-P212019` FOREIGN KEY (PatternID) REFERENCES Pattern (ID);
ALTER TABLE `Activity-Pattern` ADD CONSTRAINT `FKActivity-P428675` FOREIGN KEY (ActivityID) REFERENCES Activity (ID);
ALTER TABLE `Group` ADD CONSTRAINT FKGroup440549 FOREIGN KEY (UserID) REFERENCES `User` (ID);
ALTER TABLE Pattern ADD CONSTRAINT FKPattern953327 FOREIGN KEY (UserID) REFERENCES `User` (ID);
ALTER TABLE Process ADD CONSTRAINT FKProcess381295 FOREIGN KEY (UserID) REFERENCES `User` (ID);
ALTER TABLE Activity ADD CONSTRAINT FKActivity22180 FOREIGN KEY (ProcessID) REFERENCES Process (ID);
ALTER TABLE Group_Tags ADD CONSTRAINT FKGroup_Tags191356 FOREIGN KEY (GroupID) REFERENCES `Group` (ID);
ALTER TABLE Group_Tags ADD CONSTRAINT FKGroup_Tags244297 FOREIGN KEY (TagsID) REFERENCES Tags (ID);
ALTER TABLE `Group-Pattern` ADD CONSTRAINT `FKGroup-Patt405995` FOREIGN KEY (PatternID) REFERENCES Pattern (ID);
ALTER TABLE Profile_Permission ADD CONSTRAINT FKProfile_Pe425186 FOREIGN KEY (ProfileID) REFERENCES Profile (ID);
ALTER TABLE Profile_Permission ADD CONSTRAINT FKProfile_Pe892085 FOREIGN KEY (PermissionID) REFERENCES Permission (ID);
ALTER TABLE `User` ADD CONSTRAINT FKUser526367 FOREIGN KEY (ProfileID) REFERENCES Profile (ID);
ALTER TABLE `User` ADD CONSTRAINT FKUser145024 FOREIGN KEY (OrganizationID) REFERENCES Organization (ID);
ALTER TABLE Sentence ADD CONSTRAINT FKSentence46239 FOREIGN KEY (VerbID) REFERENCES Verb (ID);
