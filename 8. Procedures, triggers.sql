/* Процедура, которая пересчитывает обновленное значение рейтинга игроков после матча.
Работает в паре с триггером, из которого вызывается */

DELIMITER $$
USE `sc2_project`$$
CREATE PROCEDURE `count_mmr`(IN player_1_id INT, IN player_2_id INT, IN mmr_1 SMALLINT, IN mmr_2 SMALLINT)
BEGIN
UPDATE `profile` 
SET 
    mmr = mmr + mmr_1
WHERE
    user_id = player_1_id;
UPDATE `profile` 
SET 
    mmr = mmr + mmr_2
WHERE
    user_id = player_2_id;
END$$

DELIMITER ;

-- **********************************************************************************

/* Триггер, который срабатывает после окончания матча и внесения его в базу.
Вызывает процедуру для изменения рейтинга игроков. */

DELIMITER $$
USE `sc2_project`$$
CREATE TRIGGER `match_AFTER_INSERT` AFTER INSERT ON `match` FOR EACH ROW
BEGIN
    CALL count_mmr(new.player_1_id, new.player_2_id, new.player_1_mmr_change, new.player_2_mmr_change);
END$$
DELIMITER ;