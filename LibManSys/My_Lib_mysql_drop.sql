ALTER TABLE `Book_Copy` DROP FOREIGN KEY `Book_Copy_fk0`;

ALTER TABLE `Book_Copy` DROP FOREIGN KEY `Book_Copy_fk1`;

ALTER TABLE `Borrowal` DROP FOREIGN KEY `Borrowal_fk0`;

ALTER TABLE `Borrowal` DROP FOREIGN KEY `Borrowal_fk1`;

ALTER TABLE `Books_Branch_Contains` DROP FOREIGN KEY `Books_Branch_Contains_fk0`;

ALTER TABLE `Books_Branch_Contains` DROP FOREIGN KEY `Books_Branch_Contains_fk1`;

ALTER TABLE `Books_Branch_Contains` DROP FOREIGN KEY `Books_Branch_Contains_fk2`;

ALTER TABLE `Branch_Supplier` DROP FOREIGN KEY `Branch_Supplier_fk0`;

ALTER TABLE `Branch_Supplier` DROP FOREIGN KEY `Branch_Supplier_fk1`;

DROP TABLE IF EXISTS `Branch`;

DROP TABLE IF EXISTS `Supplier`;

DROP TABLE IF EXISTS `Book`;

DROP TABLE IF EXISTS `Book_Copy`;

DROP TABLE IF EXISTS `Member`;

DROP TABLE IF EXISTS `Borrowal`;

DROP TABLE IF EXISTS `Books_Branch_Contains`;

DROP TABLE IF EXISTS `Branch_Supplier`;

