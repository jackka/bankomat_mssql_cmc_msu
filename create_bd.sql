drop table if exists atm_state;
CREATE TABLE `atm_state`(
	`id` int(11) not NULL,
	`printed_counter` int(11) NULL,
	`printer_roll_size` int(11) NULL,
	`jail_counter` int(11) NULL,
	`jail_capacity_size` int(11) NULL,
	`storage_opened` bit NULL,
	`cur_operation_id` int(11) NULL,
	`tray_opened` bit NULL,
	`max_attempts` tinyint NULL
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `atm_state`  ADD PRIMARY KEY (`id`);


drop table if exists failed_attempts;
CREATE TABLE `failed_attempts`(
	`t_stamp` timestamp NULL,
	`card_id` int(11) NOT NULL,
	`att_numb` tinyint 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `failed_attempts` ADD PRIMARY KEY (`t_stamp`);


drop table if exists cards;
CREATE TABLE `cards`(
	`id` int(11) not NULL,
	`number` TEXT not NULL,
	`balance` bigint NULL,
	`jailed` bit NULL,
	`blocked` bit NULL,
	`pin` smallint not NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `cards`  ADD PRIMARY KEY (`id`);
ALTER TABLE `cards` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


drop table if exists cash_storage;
CREATE TABLE `cash_storage`(
	`nom_id` tinyint NULL,
	`nominal` int(11) NULL,
	`quantity` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `cash_storage`  ADD PRIMARY KEY (`nom_id`);
 
 
 
drop table if exists display_msgs;
CREATE TABLE `display_msgs`(
	`id` int(11) NULL,
	`display_msg` text NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `display_msgs` ADD PRIMARY KEY(`id`); 
ALTER TABLE `display_msgs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
 
 
drop table if exists jailed_cards;
CREATE TABLE `jailed_cards`(
	`log_id` int(11) NULL,
	`card_id` int(11) NULL,
	`reason` text NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `jailed_cards`   ADD PRIMARY KEY (`log_id`,`card_id`);


drop table if exists operations;
CREATE TABLE `operations`(
	`id` INT(11) NULL,
	`name` text NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `operations`   ADD PRIMARY KEY (`ID`);
ALTER TABLE `operations` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

drop table if exists transacts_log;
CREATE TABLE `transacts_log`(
	`id` int(11) NOT NULL,
	`t_stamp` timestamp NULL,
	`card_id` int(11) NOT NULL,
	`op_type` int(11) NULL,
	`amount` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `transacts_log` ADD PRIMARY KEY (`ID`,`t_stamp`);
ALTER TABLE `transacts_log` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



drop table if exists transacts_nomin;
CREATE TABLE `transacts_nomin`(
	`transact_id` int NULL,
	`nom_id` tinyint NULL,
	`quantity` int(11) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `transacts_nomin`  ADD PRIMARY KEY (`transact_id`,`nom_id`);