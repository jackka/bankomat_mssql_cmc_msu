--Скрипты для создния базы и для восстановления разные д.б. Так как date("Y-m-d H:i:s") даст одинаковые даты, а это ключ.


-- data creation
-------------------
-- transacts_log, transacts_nomin
INSERT INTO `failed_attempts` (	`t_stamp`, `card_id`, `att_numb`) VALUES ( date("Y-m-d H:i:s"), '1', 1);
INSERT INTO `failed_attempts` (	`t_stamp`, `card_id`, `att_numb`) VALUES ( date("Y-m-d H:i:s"), '1', 2);
INSERT INTO `failed_attempts` (	`t_stamp`, `card_id`, `att_numb`) VALUES ( date("Y-m-d H:i:s"), '1', 3);

INSERT INTO `transacts_log` (`t_stamp`, `card_id`, `op_type`, `amount`) VALUES ( date("Y-m-d H:i:s"), '1', '4', 0);

INSERT INTO `transacts_log` (`t_stamp`, `card_id`, `op_type`, `amount`) VALUES ( date("Y-m-d H:i:s"), '2', '3', 60);
INSERT INTO `transacts_nomin` (`transact_id`, `nom_id`, `quantity`) VALUES ('2', '2', 1), ('2', '1', 1);
-- cards
INSERT INTO`cards`(`number`,`balance`,`jailed`,`blocked`,`pin`)VALUES
('9719947123103653','1728600',0,0,'9589')
,('6334316107518863','2701817',0,0,'9671')
,('6526073432324998','4249949',0,0,'3924')
,('4707195062126148','2344053',0,0,'6432')
,('3936748470915716','1579118',0,0,'1266')
,('8224297047260449','3015387',0,0,'6166')
,('8799157300453377','4758192',0,0,'5623')
,('7774173679569022','3824713',0,0,'0552')
,('1949211256839244','2227701',0,0,'9627')
,('4294402783247332','901668',0,0,'5552')
,('3683768337737539','2879376',0,0,'3208')
,('7518635584817453','4998382',0,0,'9482')
,('0603491151830123','183914',0,0,'6463')
,('4141830323034059','4245022',0,0,'5382')
,('3994302240565684','309271',0,0,'0630')
,('7995592291198153','122719',0,0,'9561')
,('5162090652997444','2312729',0,0,'4710')
,('8074763557742119','1671053',0,0,'2484')
,('4979044416073799','1173236',0,0,'6287');

INSERT INTO `atm_state` (`printed_counter`, `printer_roll_size`, `jail_counter`, 
`jail_capacity_size`, `storage_opened`, `cur_operation_id`, 
`tray_opened`, `failed_attempts`, `max_attempts`) VALUES
(53864, 60000, 150, 200, b'0', 1, b'0', 1, 3);


INSERT INTO `cash_storage` (`nom_id`, `nominal`, `quantity`) VALUES 
('1', '10',  '580'),
('2', '50',  '4485'),
('3', '100', '3851'),
('4', '200', '884'),
('5', '500', '3464'),
('6', '1000','4643');

INSERT INTO `display_msgs` ( `display_msg`) VALUES 
( 'Добрый день! Вставьте вашу карточку'),
( 'Ваша карточка заблокирована!'),
( 'Введите PIN код.'),
( 'Неправильный PIN, повторите попытку.' ),
( 'Заберите Ваши деньги.'),
( 'Распечатать чек?'),
( 'Если Вы забыли взять свою карточку, то после полутора минут
ожидания и неоднократного предупреждения банкомат затягивает
карточку внутрь. Не пытайтесь ее самостоятельно достать!!!
'),
( 'В данном банкомате закончилась лента.'),
( 'Баланс на вашей карточке составляет');

INSERT INTO `operations` (`id`,`name`) VALUES 
(1, 'welcome'),
(2, 'printing'),
(3, 'withdrawal'),
(4, 'jailing');
(5, 'service');



INSERT INTO `transacts_log` (`t_stamp`, `card_id`, `op_type`, `amount`) VALUES
( date("Y-m-d H:i:s"), '1', '4', 0);



