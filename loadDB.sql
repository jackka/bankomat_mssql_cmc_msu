INSERT INTO [dbo].[atm_state] ([id], [printed_counter], [printer_roll_size], [jail_counter], [jail_capacity_size], [storage_opened], [cur_operation_id], [tray_opened], [failed_attempts], [max_attempts]) VALUES
(0, 53864, 60000, 150, 200, 0, 1, 0, 0, 3);


SET IDENTITY_INSERT [dbo].[cards] ON

INSERT INTO [dbo].[cards] ([id], [number], [balance], [jailed], [blocked], [pin]) VALUES
(1, '9719947123103653', 1728600, '1', '0', 9589),
(2, '6334316107518863', 2701817, '0', '0', 9671),
(3, '6526073432324998', 4249949, '0', '0', 3924),
(4, '4707195062126148', 2344053, '0', '1', 6432),
(5, '3936748470915716', 1579118, '0', '0', 1266),
(6, '7129647554471344', 1174655, '0', '0', 6402),
(7, '3617410420889243', 4022370, '0', '0', 7319),
(8, '8108050438734260', 1165063, '0', '0', 3753),
(9, '1167780474736521', 1006633, '0', '0', 2135),
(10, '5795013969441869', 1128548, '0', '0', 3043),
(11, '5664451847250302', 3086212, '0', '0', 3587),
(12, '4951605584309336', 2112940, '0', '0', 4768),
(13, '1660157273834602', 4821485, '0', '0', 9455),
(14, '9348880923261284', 4180142, '0', '0', 5828),
(15, '3978480363213167', 1586022, '0', '0', 9614),
(16, '7507314401291228', 1484729, '0', '0', 2843),
(17, '7461273012604442', 4719858, '0', '0', 9174),
(18, '1844955173900415', 1895220, '0', '0', 756),
(19, '1257406842378018', 847760, '0', '0', 6054),
(20, '2320785462061533', 2043203, '0', '0', 5903);

SET IDENTITY_INSERT [dbo].[cards] OFF


INSERT INTO [dbo].[cash_storage] ([nom_id], [nominal], [quantity]) VALUES
(1, 10, 580),
(2, 50, 4485),
(3, 100, 3851),
(4, 200, 884),
(5, 500, 3464),
(6, 1000, 4643);


INSERT INTO [dbo].[display_msgs] ([id], [lang], [display_msg]) VALUES
(1, 0, 'Добрый день! Вставьте вашу карточку'),
(2, 0, 'Ваша карточка заблокирована!'),
(3, 0, 'Введите PIN код.'),
(4, 0, 'Неправильный PIN, повторите попытку.'),
(5, 0, 'Заберите Ваши деньги.'),
(6, 0, 'Распечатать чек?'),
(7, 0, 'Если Вы забыли взять свою карточку, то после полутора минут\r\nожидания и неоднократного предупреждения банкомат затягивает\r\nкарточку внутрь. Не пытайтесь ее самостоятельно достать!!!\r\n'),
(8, 0, 'В данном банкомате закончилась лента.'),
(9, 0, 'Баланс на вашей карточке составляет');
(10, 0, 'Недостаточно средств');




INSERT INTO [dbo].[jailed_cards] ([log_id], [card_id], [reason]) VALUES
(0, 1, 'exc-att');


SET IDENTITY_INSERT [dbo].[operations] ON

INSERT INTO [dbo].[operations] ([id], [name]) VALUES
(1, 'welcome'),
(2, 'printing'),
(3, 'withdrawal'),
(4, 'jailing'),
(5, 'service'),
(6, 'pin_ent');

SET IDENTITY_INSERT [dbo].[operations] OFF


SET IDENTITY_INSERT [dbo].[transacts_log] ON

INSERT INTO [dbo].[transacts_log] ([id], [t_stamp], [card_id], [op_type], [amount]) VALUES
(1, '2021-01-16 23:26:22', 1, 6, 0),
(2, '2021-01-16 23:26:22', 1, 6, 0),
(3, '2021-01-16 23:26:22', 1, 6, 0),
(4, '2021-01-16 23:26:22', 1, 4, 0),
(5, '2021-01-16 23:55:09', 2, 3, 60);

SET IDENTITY_INSERT [dbo].[transacts_log] OFF
go

INSERT INTO [dbo].[transacts_nomin] ([transact_id], [nom_id], [quantity]) VALUES
(2, 1, 1),
(2, 2, 1);



INSERT INTO [dbo].[failed_attempts] ([t_stamp], [card_id], [att_numb]) VALUES
('2021-01-16 23:53:26', 1, 1),
('2021-01-16 23:53:40', 1, 2),
('2021-01-16 23:53:51', 1, 3);