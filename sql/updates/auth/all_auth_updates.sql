ALTER TABLE `account_access`  ADD COLUMN `comment` VARCHAR(35) NOT NULL DEFAULT 'name of the account';
ALTER TABLE `account_banned` DROP COLUMN `realm`;
