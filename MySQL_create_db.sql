DROP TABLE IF EXISTS `atm_state`;
CREATE TABLE `atm_state` (
  `id` int(11) NOT NULL,
  `printed_counter` int(11) DEFAULT NULL,
  `printer_roll_size` int(11) DEFAULT NULL,
  `jail_counter` int(11) DEFAULT NULL,
  `jail_capacity_size` int(11) DEFAULT NULL,
  `storage_opened` bit(1) DEFAULT NULL,
  `cur_operation_id` int(11) DEFAULT NULL,
  `tray_opened` bit(1) DEFAULT NULL,
  `failed_attempts` tinyint(4) DEFAULT NULL,
  `max_attempts` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `atm_state`  ADD PRIMARY KEY (`id`);


#############сделать view из этой таблицы (из лога попытки, )
drop table if exists failed_attempts;
CREATE TABLE `failed_attempts`(
	`t_stamp` timestamp NULL,
	`card_id` int(11) NOT NULL,
	`att_numb` tinyint 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `failed_attempts` ADD PRIMARY KEY (`t_stamp`);

#############сделать view для общей суммы
разделения суммы из транзакт лога по номиналам


DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `number` text NOT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `jailed` bit(1) DEFAULT NULL,
  `blocked` bit(1) DEFAULT NULL,
  `pin` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `cards`  ADD PRIMARY KEY (`id`);
ALTER TABLE `cards` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


DROP TABLE IF EXISTS `cash_storage`;
CREATE TABLE `cash_storage` (
  `nom_id` tinyint(4) NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `cash_storage`  ADD PRIMARY KEY (`nom_id`);
 
 
 
DROP TABLE IF EXISTS `display_msgs`;
CREATE TABLE `display_msgs` (
  `id` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `display_msg` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `display_msgs` ADD PRIMARY KEY(`id`,`lang`); 
 
 
 
DROP TABLE IF EXISTS `jailed_cards`;
CREATE TABLE `jailed_cards` (
  `log_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `reason` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `jailed_cards`   ADD PRIMARY KEY (`log_id`,`card_id`);


DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `operations`   ADD PRIMARY KEY (`ID`);
ALTER TABLE `operations` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



DROP TABLE IF EXISTS `transacts_log`;
CREATE TABLE `transacts_log` (
  `id` int(11) NOT NULL,
  `t_stamp` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `op_type` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `transacts_log` ADD PRIMARY KEY (`ID`,`t_stamp`);
ALTER TABLE `transacts_log` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



DROP TABLE IF EXISTS `transacts_nomin`;
CREATE TABLE `transacts_nomin` (
  `transact_id` int(11) NOT NULL,
  `nom_id` tinyint(4) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `transacts_nomin`  ADD PRIMARY KEY (`transact_id`,`nom_id`);